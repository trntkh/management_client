module Webpacker
    module OneTimeCompiler
      def compile
        @compiled ||= super
      end
    end
  
    Compiler.prepend(OneTimeCompiler) if Webpacker.config.compile?
end