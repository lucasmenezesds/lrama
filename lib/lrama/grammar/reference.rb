module Lrama
  class Grammar
    # type: :dollar or :at
    # name: String (e.g. $$, $foo, $expr.right)
    # index: Integer (e.g. $1)
    # ex_tag: "$<tag>1" (Optional)
    class Reference < Struct.new(:type, :name, :index, :ex_tag, :first_column, :last_column, :referring_symbol, :position_in_rhs, keyword_init: true)
      def value
        name || index
      end

      def tag
        if ex_tag
          ex_tag
        else
          # FIXME: Remove this class check
          if referring_symbol.is_a?(Symbol)
            referring_symbol.tag
          else
            # Lrama::Lexer::Token (User_code) case
            nil
          end
        end
      end
    end
  end
end
