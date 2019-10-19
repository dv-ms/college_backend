# frozen_string_literal: true

class CallBacks
  def before_validation(object)
    puts "Validating #{object.class} #{object.name}"
  end

  def after_validation(object)
    if object.valid?
      puts "Valid #{object.class}"
    elsif !object.valid?
      puts "Invalid #{object.class}"
    end
  end

  # def before_save(object)
  # end

  def around_save(object)
    puts "Saving #{object.class} #{object.name}..."
    yeild
    puts "Saved #{object.class} #{object.name}"
  end

  # def after_save (object)
  # end

  # def before_create(object)
  # end

  def around_create(object)
    puts "Going to create a #{object.class}"
    yeild
    puts "Created #{object.class}: #{object.name} "
  end

  # def after_create(object)
  # end

  def after_commit(object); end

  def after_rollback(object); end

  # def before_update(object)
  # end

  def around_update(object)
    puts "Going to update #{object.class} #{object.name}"
    yeild
    puts "Updated #{object.class}: #{object.name} "
  end

  # def after_update(object)
  # end

  # def before_destroy(object)
  # end

  def around_destroy(object)
    puts "Going to destroy #{object.class} #{object.name}"
    yeild
    puts "Destroyed #{object.class}: #{object.name} "
  end

  # def after_destroy(object)
  # end

  # def after_initialize(object)
  # end

  # def after_find(object)
  # end

  def after_touch(object)
    puts "Updated #{object.class} #{object.name}"
  end

  # Callbacks skipper methods:
  # decrement!
  # decrement_counter
  # delete
  # delete_all
  # increment!
  # increment_counter
  # update_column
  # update_columns
  # update_all
  # update_counters
end
