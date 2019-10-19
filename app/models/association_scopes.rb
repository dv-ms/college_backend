# frozen_string_literal: true

# This will work
module A
  class C1 < ApplicationRecord
    has_one :c2
  end

  class C2 < ApplicationRecord
    has_many :c1
  end
end

# This will not work as out of scope
module B
  class C3 < ApplicationRecord
    belongs_to :c1
  end
end

# This will work
module C
  class C4 < ApplicationRecord
    belongs_to :c2, class_name: 'A::C2'
  end
end
