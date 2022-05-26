require "./generic_arguments"
require "./generic_method_stub"

module Spectator::Mocks
  class ExceptionMethodStub(ExceptionType) < GenericMethodStub(Nil)
    def initialize(name, location, @exception : ExceptionType, args = nil)
      super(name, location, args)
    end

    def call(_args : GenericArguments(T, NT), &_original : -> RT) forall T, NT, RT
      raise @exception
    end
  end
end
