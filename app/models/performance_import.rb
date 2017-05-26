# Model class which takes a CSV file and mass imports Performances from it
class PerformanceImport
  include ActiveModel::Model
  attr_accessor :file

  def initialize(attributes = {})
    attributes.each { |name, value| send("#{name}=", value) }
  end

  def persisted?
    false
  end

  def save
    if imported_performances.map(&:valid?).all?
      imported_performances.each(&:save!)
      true
    else
      add_errors
      false
    end
  end

  def imported_performances
    @imported_performances ||= load_imported_performances
  end

  def load_imported_performances
    performances = []
    CSV.foreach(file.path, headers: true) do |row|
      performance = Performance.find_by(id: row['id']) || Performance.new
      performance.attributes = row_to_perf_attributes(row.to_hash)
      Rails.logger.debug "Performance attributes hash:
                          #{performance.attributes.inspect}"
      performances.push(performance)
    end
    performances
  end

  # class method which takes the hash of arow from the csv
  # and converts it to a set of performance attributes
  def row_to_perf_attributes(row_attribs = {})
    show_id = Show.find_or_create(
      title: row_attribs['show title'],
      artist: row_attribs['artist'],
      duration: row_attribs['duration'],
      nationality: row_attribs['nationality']
    ).id
    room_id = Room.find_or_create(
      room_name: row_attribs['room'],
      venue_name: row_attribs['venue']
      ).id
    attributes = {
      date: row_attribs['date'],
      time: row_attribs['time'],
      show_id: show_id,
      room_id: room_id
    }
    attributes
  end

  private

  def add_errors
    imported_performances.each_with_index do |performance, index|
      performance.errors.full_messages.each do |message|
        errors.add :base, "Row #{index + 2}: #{message}"
      end
    end
  end
end
