class DepartmentsSerializer < ActiveModel::Serializer
  attributes :id, :name, :hod, :sections
  has_many :sections

  def hod
    {hod_id: self.object.hod_id,
    hod_name: self.object.hod.name}
  end

  def sections
    self.object.sections.map do |section|
      {id: section.id,
      name: section.name}
    end
  end

  def show
  end
end
