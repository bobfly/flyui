module Cards
  class DummyFormComponent < ViewComponent::Base
    def initialize(dummy:)
      @dummy = dummy
    end
  end
end
