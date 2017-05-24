class PerformanceImport
  include ActiveModel::Model
  attr_accessor :file

  def initialize(attributes = {})
    # raise 'No File Selected' if attributes.blank?
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
      performance.attributes = row.to_hash
      Rails.logger.debug "Performance attributes hash:
                          #{performance.attributes.inspect}"
      performances.push(performance)
    end
    performances
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
