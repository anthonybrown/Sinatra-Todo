require 'ostruct'

class Todo < OpenStruct

  def save
    self.id ||= rand(99999999).to_s
    unless self.title.strip == ""
      Todo.db[self.id] = self
    end
  end

  def update_attributes(attributes = {})
    attributes.each {|k,v| self.send("#{k}=", v)}
    self.save
  end

  def destroy
    Todo.db.delete(self.id)
  end

  def persisted?
    self.id
  end

  def completed?
    !(self.completed.nil? || self.completed == "")
  end

  class << self

    def db
      @todos ||= {}
    end

    def find(id)
      Todo.db[id]
    end

    def all
      Todo.db.values
    end

    def create(attributes = {})
      todo = Todo.new(attributes)
      todo.save
      return todo
    end

  end

end
