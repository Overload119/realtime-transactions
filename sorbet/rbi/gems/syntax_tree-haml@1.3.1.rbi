# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `syntax_tree-haml` gem.
# Please instead update this file by running `bin/tapioca gem syntax_tree-haml`.

# @private
#
# source://syntax_tree-haml//lib/syntax_tree/haml.rb#53
class Haml::Parser::ParseNode < ::Struct
  # @return [ParseNode] a new instance of ParseNode
  #
  # source://haml/5.2.2/lib/haml/parser.rb#203
  def initialize(*args); end

  # Here we're going to hook into the parse node and define a method that will
  # accept a visitor in order to walk through the tree.
  #
  # source://syntax_tree-haml//lib/syntax_tree/haml.rb#56
  def accept(visitor); end

  # Returns the value of attribute children
  #
  # @return [Object] the current value of children
  def children; end

  # Sets the attribute children
  #
  # @param value [Object] the value to set the attribute children to.
  # @return [Object] the newly set value
  #
  # source://haml/5.2.2/lib/haml/parser.rb#202
  def children=(_); end

  # source://syntax_tree-haml//lib/syntax_tree/haml.rb#79
  def format(q); end

  # source://haml/5.2.2/lib/haml/parser.rb#208
  def inspect; end

  # Returns the value of attribute line
  #
  # @return [Object] the current value of line
  def line; end

  # Sets the attribute line
  #
  # @param value [Object] the value to set the attribute line to.
  # @return [Object] the newly set value
  #
  # source://haml/5.2.2/lib/haml/parser.rb#202
  def line=(_); end

  # Returns the value of attribute parent
  #
  # @return [Object] the current value of parent
  def parent; end

  # Sets the attribute parent
  #
  # @param value [Object] the value to set the attribute parent to.
  # @return [Object] the newly set value
  #
  # source://haml/5.2.2/lib/haml/parser.rb#202
  def parent=(_); end

  # source://syntax_tree-haml//lib/syntax_tree/haml.rb#83
  def pretty_print(q); end

  # Returns the value of attribute type
  #
  # @return [Object] the current value of type
  def type; end

  # Sets the attribute type
  #
  # @param value [Object] the value to set the attribute type to.
  # @return [Object] the newly set value
  #
  # source://haml/5.2.2/lib/haml/parser.rb#202
  def type=(_); end

  # Returns the value of attribute value
  #
  # @return [Object] the current value of value
  def value; end

  # Sets the attribute value
  #
  # @param value [Object] the value to set the attribute value to.
  # @return [Object] the newly set value
  #
  # source://haml/5.2.2/lib/haml/parser.rb#202
  def value=(_); end

  class << self
    def [](*_arg0); end
    def inspect; end
    def members; end
    def new(*_arg0); end
  end
end

# source://syntax_tree-haml//lib/syntax_tree/haml.rb#7
module SyntaxTree
  class << self
    # source://syntax_tree/3.5.0/lib/syntax_tree.rb#52
    def format(source, maxwidth = T.unsafe(nil)); end

    # source://syntax_tree/3.5.0/lib/syntax_tree.rb#45
    def parse(source); end

    # source://syntax_tree/3.5.0/lib/syntax_tree.rb#62
    def read(filepath); end

    # source://syntax_tree/3.5.0/lib/syntax_tree.rb#40
    def register_handler(extension, handler); end
  end
end

# source://syntax_tree/3.5.0/lib/syntax_tree.rb#36
SyntaxTree::DEFAULT_PRINT_WIDTH = T.let(T.unsafe(nil), Integer)

# source://syntax_tree/3.5.0/lib/syntax_tree.rb#30
SyntaxTree::HANDLERS = T.let(T.unsafe(nil), Hash)

# source://syntax_tree-haml//lib/syntax_tree/haml.rb#8
module SyntaxTree::Haml
  class << self
    # This is the main entrypoint for the formatter. It parses the source,
    # builds a formatter, then pretty prints the result.
    #
    # source://syntax_tree-haml//lib/syntax_tree/haml.rb#36
    def format(source, maxwidth = T.unsafe(nil)); end

    # This is the main parser entrypoint, and just delegates to the Haml gem's
    # parser to do the heavy lifting.
    #
    # source://syntax_tree-haml//lib/syntax_tree/haml.rb#30
    def parse(source); end

    # This is a required API for syntax tree which just delegates to File.read.
    #
    # source://syntax_tree-haml//lib/syntax_tree/haml.rb#41
    def read(filepath); end
  end
end

# source://syntax_tree-haml//lib/syntax_tree/haml.rb#9
SyntaxTree::Haml::DOCTYPE_TYPES = T.let(T.unsafe(nil), Hash)

# source://syntax_tree-haml//lib/syntax_tree/haml.rb#18
SyntaxTree::Haml::DOCTYPE_VERSIONS = T.let(T.unsafe(nil), Array)

# source://syntax_tree-haml//lib/syntax_tree/haml/format.rb#5
class SyntaxTree::Haml::Format < ::SyntaxTree::Haml::Visitor
  # @return [Format] a new instance of Format
  #
  # source://syntax_tree-haml//lib/syntax_tree/haml/format.rb#8
  def initialize(q); end

  # Returns the value of attribute q.
  #
  # source://syntax_tree-haml//lib/syntax_tree/haml/format.rb#6
  def q; end

  # https://haml.info/docs/yardoc/file.REFERENCE.html#html-comments-
  #
  # source://syntax_tree-haml//lib/syntax_tree/haml/format.rb#13
  def visit_comment(node); end

  # https://haml.info/docs/yardoc/file.REFERENCE.html#doctype-
  #
  # source://syntax_tree-haml//lib/syntax_tree/haml/format.rb#27
  def visit_doctype(node); end

  # https://haml.info/docs/yardoc/file.REFERENCE.html#filter
  #
  # source://syntax_tree-haml//lib/syntax_tree/haml/format.rb#43
  def visit_filter(node); end

  # https://haml.info/docs/yardoc/file.REFERENCE.html#haml-comments--
  #
  # source://syntax_tree-haml//lib/syntax_tree/haml/format.rb#60
  def visit_haml_comment(node); end

  # https://haml.info/docs/yardoc/file.REFERENCE.html#plain-text
  #
  # source://syntax_tree-haml//lib/syntax_tree/haml/format.rb#78
  def visit_plain(node); end

  # Visit the root node of the AST.
  #
  # source://syntax_tree-haml//lib/syntax_tree/haml/format.rb#85
  def visit_root(node); end

  # https://haml.info/docs/yardoc/file.REFERENCE.html#inserting_ruby
  #
  # source://syntax_tree-haml//lib/syntax_tree/haml/format.rb#93
  def visit_script(node); end

  # https://haml.info/docs/yardoc/file.REFERENCE.html#running-ruby--
  #
  # source://syntax_tree-haml//lib/syntax_tree/haml/format.rb#105
  def visit_silent_script(node); end

  # Visit a tag node.
  #
  # source://syntax_tree-haml//lib/syntax_tree/haml/format.rb#265
  def visit_tag(node); end

  private

  # When printing out sequences of silent scripts, sometimes subsequent nodes
  # will be continuations of previous nodes. In that case we want to dedent
  # them to match.
  #
  # @return [Boolean]
  #
  # source://syntax_tree-haml//lib/syntax_tree/haml/format.rb#374
  def continuation?(node, child); end

  # If a node comes in as the plain type but starts with one of the special
  # characters that haml parses, then we need to escape it with a \ when
  # printing.
  #
  # @return [Boolean]
  #
  # source://syntax_tree-haml//lib/syntax_tree/haml/format.rb#390
  def escaped?(text); end

  # Take a source string and attempt to parse it into a set of attributes that
  # can be used to format the source.
  #
  # source://syntax_tree-haml//lib/syntax_tree/haml/format.rb#398
  def parse_attributes(source); end

  # source://syntax_tree-haml//lib/syntax_tree/haml/format.rb#410
  def with_children(node); end
end

# source://syntax_tree-haml//lib/syntax_tree/haml/format.rb#182
class SyntaxTree::Haml::Format::HTMLAttributesPart
  # @return [HTMLAttributesPart] a new instance of HTMLAttributesPart
  #
  # source://syntax_tree-haml//lib/syntax_tree/haml/format.rb#185
  def initialize(raw); end

  # source://syntax_tree-haml//lib/syntax_tree/haml/format.rb#192
  def format(q, align); end

  # source://syntax_tree-haml//lib/syntax_tree/haml/format.rb#206
  def length; end

  # Returns the value of attribute values.
  #
  # source://syntax_tree-haml//lib/syntax_tree/haml/format.rb#183
  def values; end
end

# source://syntax_tree-haml//lib/syntax_tree/haml/format.rb#211
class SyntaxTree::Haml::Format::HashAttributesPart < ::Struct
  # source://syntax_tree-haml//lib/syntax_tree/haml/format.rb#212
  def format(q, align); end

  # source://syntax_tree-haml//lib/syntax_tree/haml/format.rb#216
  def length; end

  private

  # source://syntax_tree-haml//lib/syntax_tree/haml/format.rb#224
  def format_value(q, hash, level = T.unsafe(nil)); end
end

# source://syntax_tree-haml//lib/syntax_tree/haml/format.rb#124
class SyntaxTree::Haml::Format::LiteralHashValue < ::Struct
  # Returns the value of attribute value
  #
  # @return [Object] the current value of value
  def value; end

  # Sets the attribute value
  #
  # @param value [Object] the value to set the attribute value to.
  # @return [Object] the newly set value
  #
  # source://syntax_tree-haml//lib/syntax_tree/haml/format.rb#124
  def value=(_); end

  class << self
    def [](*_arg0); end
    def inspect; end
    def members; end
    def new(*_arg0); end
  end
end

# When formatting a tag, there are a lot of different kinds of things that
# can be printed out. There's the tag name, the attributes, the content,
# etc. This object is responsible for housing all of those parts.
#
# source://syntax_tree-haml//lib/syntax_tree/haml/format.rb#131
class SyntaxTree::Haml::Format::PartList
  # @return [PartList] a new instance of PartList
  #
  # source://syntax_tree-haml//lib/syntax_tree/haml/format.rb#134
  def initialize(node); end

  # source://syntax_tree-haml//lib/syntax_tree/haml/format.rb#139
  def <<(part); end

  # @return [Boolean]
  #
  # source://syntax_tree-haml//lib/syntax_tree/haml/format.rb#143
  def empty?; end

  # source://syntax_tree-haml//lib/syntax_tree/haml/format.rb#147
  def format(q); end

  # Returns the value of attribute node.
  #
  # source://syntax_tree-haml//lib/syntax_tree/haml/format.rb#132
  def node; end

  # Returns the value of attribute parts.
  #
  # source://syntax_tree-haml//lib/syntax_tree/haml/format.rb#132
  def parts; end
end

# source://syntax_tree-haml//lib/syntax_tree/haml/format.rb#162
class SyntaxTree::Haml::Format::PlainPart < ::Struct
  # source://syntax_tree-haml//lib/syntax_tree/haml/format.rb#163
  def format(q, align); end

  # source://syntax_tree-haml//lib/syntax_tree/haml/format.rb#167
  def length; end
end

# source://syntax_tree-haml//lib/syntax_tree/haml/format.rb#172
class SyntaxTree::Haml::Format::PrefixPart < ::Struct
  # source://syntax_tree-haml//lib/syntax_tree/haml/format.rb#173
  def format(q, align); end

  # source://syntax_tree-haml//lib/syntax_tree/haml/format.rb#177
  def length; end
end

# source://syntax_tree-haml//lib/syntax_tree/haml/format.rb#126
class SyntaxTree::Haml::Format::StringHashValue < ::Struct
  # Returns the value of attribute quote
  #
  # @return [Object] the current value of quote
  def quote; end

  # Sets the attribute quote
  #
  # @param value [Object] the value to set the attribute quote to.
  # @return [Object] the newly set value
  #
  # source://syntax_tree-haml//lib/syntax_tree/haml/format.rb#126
  def quote=(_); end

  # Returns the value of attribute value
  #
  # @return [Object] the current value of value
  def value; end

  # Sets the attribute value
  #
  # @param value [Object] the value to set the attribute value to.
  # @return [Object] the newly set value
  #
  # source://syntax_tree-haml//lib/syntax_tree/haml/format.rb#126
  def value=(_); end

  class << self
    def [](*_arg0); end
    def inspect; end
    def members; end
    def new(*_arg0); end
  end
end

# source://syntax_tree-haml//lib/syntax_tree/haml/pretty_print.rb#5
class SyntaxTree::Haml::PrettyPrint < ::SyntaxTree::Haml::Visitor
  # @return [PrettyPrint] a new instance of PrettyPrint
  #
  # source://syntax_tree-haml//lib/syntax_tree/haml/pretty_print.rb#8
  def initialize(q); end

  # Returns the value of attribute q.
  #
  # source://syntax_tree-haml//lib/syntax_tree/haml/pretty_print.rb#6
  def q; end

  # https://haml.info/docs/yardoc/file.REFERENCE.html#html-comments-
  #
  # source://syntax_tree-haml//lib/syntax_tree/haml/pretty_print.rb#13
  def visit_comment(node); end

  # https://haml.info/docs/yardoc/file.REFERENCE.html#doctype-
  #
  # source://syntax_tree-haml//lib/syntax_tree/haml/pretty_print.rb#27
  def visit_doctype(node); end

  # https://haml.info/docs/yardoc/file.REFERENCE.html#filter
  #
  # source://syntax_tree-haml//lib/syntax_tree/haml/pretty_print.rb#42
  def visit_filter(node); end

  # https://haml.info/docs/yardoc/file.REFERENCE.html#haml-comments--
  #
  # source://syntax_tree-haml//lib/syntax_tree/haml/pretty_print.rb#50
  def visit_haml_comment(node); end

  # https://haml.info/docs/yardoc/file.REFERENCE.html#plain-text
  #
  # source://syntax_tree-haml//lib/syntax_tree/haml/pretty_print.rb#55
  def visit_plain(node); end

  # Visit the root node of the AST.
  #
  # source://syntax_tree-haml//lib/syntax_tree/haml/pretty_print.rb#60
  def visit_root(node); end

  # https://haml.info/docs/yardoc/file.REFERENCE.html#inserting_ruby
  #
  # source://syntax_tree-haml//lib/syntax_tree/haml/pretty_print.rb#67
  def visit_script(node); end

  # https://haml.info/docs/yardoc/file.REFERENCE.html#running-ruby--
  #
  # source://syntax_tree-haml//lib/syntax_tree/haml/pretty_print.rb#77
  def visit_silent_script(node); end

  # Visit a tag node.
  #
  # source://syntax_tree-haml//lib/syntax_tree/haml/pretty_print.rb#85
  def visit_tag(node); end

  private

  # source://syntax_tree-haml//lib/syntax_tree/haml/pretty_print.rb#127
  def bool_field(name); end

  # source://syntax_tree-haml//lib/syntax_tree/haml/pretty_print.rb#132
  def group(name); end

  # source://syntax_tree-haml//lib/syntax_tree/haml/pretty_print.rb#143
  def pp_field(name, value); end

  # source://syntax_tree-haml//lib/syntax_tree/haml/pretty_print.rb#150
  def text_field(name, value); end
end

# This is the parent class of the various visitors that we provide to access
# the HAML syntax tree.
#
# source://syntax_tree-haml//lib/syntax_tree/haml.rb#22
class SyntaxTree::Haml::Visitor
  # source://syntax_tree-haml//lib/syntax_tree/haml.rb#23
  def visit(node); end
end

# source://syntax_tree/3.5.0/lib/syntax_tree/node.rb#5131
SyntaxTree::PATTERNS = T.let(T.unsafe(nil), Array)

# source://syntax_tree/3.5.0/lib/syntax_tree/version.rb#4
SyntaxTree::VERSION = T.let(T.unsafe(nil), String)