# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `prettier_print` gem.
# Please instead update this file by running `bin/tapioca gem prettier_print`.

# This class implements a pretty printing algorithm. It finds line breaks and
# nice indentations for grouped structure.
#
# By default, the class assumes that primitive elements are strings and each
# byte in the strings is a single column in width. But it can be used for other
# situations by giving suitable arguments for some methods:
#
# * newline object and space generation block for PrettierPrint.new
# * optional width argument for PrettierPrint#text
# * PrettierPrint#breakable
#
# There are several candidate uses:
# * text formatting using proportional fonts
# * multibyte characters which has columns different to number of bytes
# * non-string formatting
#
# == Usage
#
# To use this module, you will need to generate a tree of print nodes that
# represent indentation and newline behavior before it gets sent to the printer.
# Each node has different semantics, depending on the desired output.
#
# The most basic node is a Text node. This represents plain text content that
# cannot be broken up even if it doesn't fit on one line. You would create one
# of those with the text method, as in:
#
#     PrettierPrint.format { |q| q.text('my content') }
#
# No matter what the desired output width is, the output for the snippet above
# will always be the same.
#
# If you want to allow the printer to break up the content on the space
# character when there isn't enough width for the full string on the same line,
# you can use the Breakable and Group nodes. For example:
#
#     PrettierPrint.format do |q|
#       q.group do
#         q.text("my")
#         q.breakable
#         q.text("content")
#       end
#     end
#
# Now, if everything fits on one line (depending on the maximum width specified)
# then it will be the same output as the first example. If, however, there is
# not enough room on the line, then you will get two lines of output, one for
# the first string and one for the second.
#
# There are other nodes for the print tree as well, described in the
# documentation below. They control alignment, indentation, conditional
# formatting, and more.
#
# == References
# Christian Lindig, Strictly Pretty, March 2000
# https://lindig.github.io/papers/strictly-pretty-2000.pdf
#
# Philip Wadler, A prettier printer, March 1998
# https://homepages.inf.ed.ac.uk/wadler/papers/prettier/prettier.pdf
#
# source://prettier_print//lib/prettier_print.rb#62
class PrettierPrint
  # Creates a buffer for pretty printing.
  #
  # +output+ is an output target. If it is not specified, '' is assumed. It
  # should have a << method which accepts the first argument +obj+ of
  # PrettierPrint#text, the first argument +separator+ of PrettierPrint#breakable,
  # the first argument +newline+ of PrettierPrint.new, and the result of a given
  # block for PrettierPrint.new.
  #
  # +maxwidth+ specifies maximum line length. If it is not specified, 80 is
  # assumed. However actual outputs may overflow +maxwidth+ if long
  # non-breakable texts are provided.
  #
  # +newline+ is used for line breaks. "\n" is used if it is not specified.
  #
  # The block is used to generate spaces. ->(n) { ' ' * n } is used if it is not
  # given.
  #
  # @return [PrettierPrint] a new instance of PrettierPrint
  #
  # source://prettier_print//lib/prettier_print.rb#678
  def initialize(output = T.unsafe(nil), maxwidth = T.unsafe(nil), newline = T.unsafe(nil), &genspace); end

  # This inserts a BreakParent node into the print tree which forces the
  # surrounding and all parent group nodes to break.
  #
  # source://prettier_print//lib/prettier_print.rb#1026
  def break_parent; end

  # This says "you can break a line here if necessary", and a +width+\-column
  # text +separator+ is inserted if a line is not broken at the point.
  #
  # If +separator+ is not specified, ' ' is used.
  #
  # If +width+ is not specified, +separator.length+ is used. You will have to
  # specify this when +separator+ is a multibyte character, for example.
  #
  # By default, if the surrounding group is broken and a newline is inserted,
  # the printer will indent the subsequent line up to the current level of
  # indentation. You can disable this behavior with the +indent+ argument if
  # that's not desired (rare).
  #
  # By default, when you insert a Breakable into the print tree, it only breaks
  # the surrounding group when the group's contents cannot fit onto the
  # remaining space of the current line. You can force it to break the
  # surrounding group instead if you always want the newline with the +force+
  # argument.
  #
  # There are a few circumstances where you'll want to force the newline into
  # the output but no insert a break parent (because you don't want to
  # necessarily force the groups to break unless they need to). In this case you
  # can pass `force: :skip_break_parent` to this method and it will not insert
  # a break parent.`
  #
  # source://prettier_print//lib/prettier_print.rb#1010
  def breakable(separator = T.unsafe(nil), width = T.unsafe(nil), indent: T.unsafe(nil), force: T.unsafe(nil)); end

  # This is an output buffer that wraps the output object and provides
  # additional functionality depending on its type.
  #
  # This defaults to Buffer::StringBuffer.new("".dup)
  #
  # source://prettier_print//lib/prettier_print.rb#637
  def buffer; end

  # A convenience method which is same as follows:
  #
  #   text(",")
  #   breakable
  #
  # source://prettier_print//lib/prettier_print.rb#868
  def comma_breakable; end

  # Returns the group most recently added to the stack.
  #
  # Contrived example:
  #   out = ""
  #   => ""
  #   q = PrettierPrint.new(out)
  #   => #<PrettierPrint:0x0>
  #   q.group {
  #     q.text q.current_group.inspect
  #     q.text q.newline
  #     q.group(q.current_group.depth + 1) {
  #       q.text q.current_group.inspect
  #       q.text q.newline
  #       q.group(q.current_group.depth + 1) {
  #         q.text q.current_group.inspect
  #         q.text q.newline
  #         q.group(q.current_group.depth + 1) {
  #           q.text q.current_group.inspect
  #           q.text q.newline
  #         }
  #       }
  #     }
  #   }
  #   => 284
  #    puts out
  #   #<PrettierPrint::Group:0x0 @depth=1>
  #   #<PrettierPrint::Group:0x0 @depth=2>
  #   #<PrettierPrint::Group:0x0 @depth=3>
  #   #<PrettierPrint::Group:0x0 @depth=4>
  #
  # source://prettier_print//lib/prettier_print.rb#721
  def current_group; end

  # This is similar to #breakable except the decision to break or not is
  # determined individually.
  #
  # Two #fill_breakable under a group may cause 4 results:
  # (break,break), (break,non-break), (non-break,break), (non-break,non-break).
  # This is different to #breakable because two #breakable under a group
  # may cause 2 results: (break,break), (non-break,non-break).
  #
  # The text +separator+ is inserted if a line is not broken at this point.
  #
  # If +separator+ is not specified, ' ' is used.
  #
  # If +width+ is not specified, +separator.length+ is used. You will have to
  # specify this when +separator+ is a multibyte character, for example.
  #
  # source://prettier_print//lib/prettier_print.rb#887
  def fill_breakable(separator = T.unsafe(nil), width = T.unsafe(nil)); end

  # Flushes all of the generated print tree onto the output buffer, then clears
  # the generated tree from memory.
  #
  # source://prettier_print//lib/prettier_print.rb#727
  def flush; end

  # An object that responds to call that takes one argument, of an Integer, and
  # returns the corresponding number of spaces.
  #
  # By default this is: ->(n) { ' ' * n }
  #
  # source://prettier_print//lib/prettier_print.rb#653
  def genspace; end

  # Groups line break hints added in the block. The line break hints are all to
  # be used or not.
  #
  # If +indent+ is specified, the method call is regarded as nested by
  # nest(indent) { ... }.
  #
  # If +open_object+ is specified, <tt>text(open_object, open_width)</tt> is
  # called before grouping. If +close_object+ is specified,
  # <tt>text(close_object, close_width)</tt> is called after grouping.
  #
  # source://prettier_print//lib/prettier_print.rb#1062
  def group(indent = T.unsafe(nil), open_object = T.unsafe(nil), close_object = T.unsafe(nil), open_width = T.unsafe(nil), close_width = T.unsafe(nil)); end

  # The stack of groups that are being printed.
  #
  # source://prettier_print//lib/prettier_print.rb#656
  def groups; end

  # Inserts an IfBreak node with the contents of the block being added to its
  # list of nodes that should be printed if the surrounding node breaks. If it
  # doesn't, then you can specify the contents to be printed with the #if_flat
  # method used on the return object from this method. For example,
  #
  #     q.if_break { q.text('do') }.if_flat { q.text('{') }
  #
  # In the example above, if the surrounding group is broken it will print 'do'
  # and if it is not it will print '{'.
  #
  # source://prettier_print//lib/prettier_print.rb#1113
  def if_break; end

  # This is similar to if_break in that it also inserts an IfBreak node into the
  # print tree, however it's starting from the flat contents, and cannot be used
  # to build the break contents.
  #
  # source://prettier_print//lib/prettier_print.rb#1124
  def if_flat; end

  # Very similar to the #nest method, this indents the nested content by one
  # level by inserting an Indent node into the print tree. The contents of the
  # node are determined by the block.
  #
  # source://prettier_print//lib/prettier_print.rb#1134
  def indent; end

  # This method calculates the position of the text relative to the current
  # indentation level when the doc has been printed. It's useful for
  # determining how to align text to doc nodes that are already built into the
  # tree.
  #
  # source://prettier_print//lib/prettier_print.rb#895
  def last_position(node); end

  # Inserts a LineSuffix node into the print tree. The contents of the node are
  # determined by the block.
  #
  # source://prettier_print//lib/prettier_print.rb#1144
  def line_suffix(priority: T.unsafe(nil)); end

  # The maximum width of a line, before it is separated in to a newline
  #
  # This defaults to 80, and should be an Integer
  #
  # source://prettier_print//lib/prettier_print.rb#642
  def maxwidth; end

  # Increases left margin after newline with +indent+ for line breaks added in
  # the block.
  #
  # source://prettier_print//lib/prettier_print.rb#1154
  def nest(indent); end

  # The value that is appended to +output+ to add a new line.
  #
  # This defaults to "\n", and should be String
  #
  # source://prettier_print//lib/prettier_print.rb#647
  def newline; end

  # The output object. It represents the final destination of the contents of
  # the print tree. It should respond to <<.
  #
  # This defaults to "".dup
  #
  # source://prettier_print//lib/prettier_print.rb#631
  def output; end

  # This method will remove any breakables from the list of contents so that
  # no newlines are present in the output. If a newline is being forced into
  # the output, the replace value will be used.
  #
  # source://prettier_print//lib/prettier_print.rb#920
  def remove_breaks(node, replace = T.unsafe(nil)); end

  # Adds a separated list.
  # The list is separated by comma with breakable space, by default.
  #
  # #seplist iterates the +list+ using +iter_method+.
  # It yields each object to the block given for #seplist.
  # The procedure +separator_proc+ is called between each yields.
  #
  # If the iteration is zero times, +separator_proc+ is not called at all.
  #
  # If +separator_proc+ is nil or not given,
  # +lambda { comma_breakable }+ is used.
  # If +iter_method+ is not given, :each is used.
  #
  # For example, following 3 code fragments has similar effect.
  #
  #   q.seplist([1,2,3]) {|v| xxx v }
  #
  #   q.seplist([1,2,3], lambda { q.comma_breakable }, :each) {|v| xxx v }
  #
  #   xxx 1
  #   q.comma_breakable
  #   xxx 2
  #   q.comma_breakable
  #   xxx 3
  #
  # source://prettier_print//lib/prettier_print.rb#969
  def seplist(list, sep = T.unsafe(nil), iter_method = T.unsafe(nil)); end

  # The current array of contents that calls to methods that generate print tree
  # nodes will append to.
  #
  # source://prettier_print//lib/prettier_print.rb#660
  def target; end

  # This adds +object+ as a text of +width+ columns in width.
  #
  # If +width+ is not specified, object.length is used.
  #
  # source://prettier_print//lib/prettier_print.rb#1165
  def text(object = T.unsafe(nil), width = T.unsafe(nil)); end

  # This inserts a Trim node into the print tree which, when printed, will clear
  # all whitespace at the end of the output buffer. This is useful for the rare
  # case where you need to delete printed indentation and force the next node
  # to start at the beginning of the line.
  #
  # source://prettier_print//lib/prettier_print.rb#1042
  def trim; end

  # A convenience method used by a lot of the print tree node builders that
  # temporarily changes the target that the builders will append to.
  #
  # source://prettier_print//lib/prettier_print.rb#1183
  def with_target(target); end

  private

  # This method returns a boolean as to whether or not the remaining commands
  # fit onto the remaining space on the current line. If we finish printing
  # all of the commands or if we hit a newline, then we return true. Otherwise
  # if we continue printing past the remaining space, we return false.
  #
  # @return [Boolean]
  #
  # source://prettier_print//lib/prettier_print.rb#1195
  def fits?(next_command, rest_commands, remaining); end

  # source://prettier_print//lib/prettier_print.rb#1262
  def remove_breaks_with(doc, replace); end

  # Resets the group stack and target array so that this pretty printer object
  # can continue to be used before calling flush again if desired.
  #
  # source://prettier_print//lib/prettier_print.rb#1257
  def reset; end

  class << self
    # This is a convenience method which is same as follows:
    #
    #   begin
    #     q = PrettierPrint.new(output, maxwidth, newline, &genspace)
    #     ...
    #     q.flush
    #     output
    #   end
    #
    # @yield [q]
    #
    # source://prettier_print//lib/prettier_print.rb#597
    def format(output = T.unsafe(nil), maxwidth = T.unsafe(nil), newline = T.unsafe(nil), genspace = T.unsafe(nil)); end

    # This is similar to PrettierPrint::format but the result has no breaks.
    #
    # +maxwidth+, +newline+ and +genspace+ are ignored.
    #
    # The invocation of +breakable+ in the block doesn't break a line and is
    # treated as just an invocation of +text+.
    #
    # @yield [q]
    #
    # source://prettier_print//lib/prettier_print.rb#616
    def singleline_format(output = T.unsafe(nil), _maxwidth = T.unsafe(nil), _newline = T.unsafe(nil), _genspace = T.unsafe(nil)); end
  end
end

# A node in the print tree that represents aligning nested nodes to a certain
# prefix width or string.
#
# source://prettier_print//lib/prettier_print.rb#65
class PrettierPrint::Align
  # @return [Align] a new instance of Align
  #
  # source://prettier_print//lib/prettier_print.rb#68
  def initialize(indent:, contents: T.unsafe(nil)); end

  # Returns the value of attribute contents.
  #
  # source://prettier_print//lib/prettier_print.rb#66
  def contents; end

  # Returns the value of attribute indent.
  #
  # source://prettier_print//lib/prettier_print.rb#66
  def indent; end

  # source://prettier_print//lib/prettier_print.rb#73
  def pretty_print(q); end
end

# A node in the print tree that forces the surrounding group to print out in
# the "break" mode as opposed to the "flat" mode. Useful for when you need to
# force a newline into a group.
#
# source://prettier_print//lib/prettier_print.rb#126
class PrettierPrint::BreakParent
  # source://prettier_print//lib/prettier_print.rb#127
  def pretty_print(q); end
end

# A node in the print tree that represents a place in the buffer that the
# content can be broken onto multiple lines.
#
# source://prettier_print//lib/prettier_print.rb#82
class PrettierPrint::Breakable
  # @return [Breakable] a new instance of Breakable
  #
  # source://prettier_print//lib/prettier_print.rb#85
  def initialize(separator = T.unsafe(nil), width = T.unsafe(nil), force: T.unsafe(nil), indent: T.unsafe(nil)); end

  # @return [Boolean]
  #
  # source://prettier_print//lib/prettier_print.rb#97
  def force?; end

  # @return [Boolean]
  #
  # source://prettier_print//lib/prettier_print.rb#101
  def indent?; end

  # source://prettier_print//lib/prettier_print.rb#105
  def pretty_print(q); end

  # Returns the value of attribute separator.
  #
  # source://prettier_print//lib/prettier_print.rb#83
  def separator; end

  # Returns the value of attribute width.
  #
  # source://prettier_print//lib/prettier_print.rb#83
  def width; end
end

# When building up the contents in the output buffer, it's convenient to be
# able to trim trailing whitespace before newlines. If the output object is a
# string or array or strings, then we can do this with some gsub calls. If
# not, then this effectively just wraps the output object and forwards on
# calls to <<.
#
# source://prettier_print//lib/prettier_print.rb#262
module PrettierPrint::Buffer
  class << self
    # This is a switch for building the correct output buffer wrapper class for
    # the given output object.
    #
    # source://prettier_print//lib/prettier_print.rb#328
    def for(output); end
  end
end

# This is an output buffer that wraps an array output object. It provides a
# trim! method that trims off trailing whitespace from the last element in
# the array if it's an unfrozen string using the same method as the
# StringBuffer.
#
# source://prettier_print//lib/prettier_print.rb#301
class PrettierPrint::Buffer::ArrayBuffer < ::PrettierPrint::Buffer::DefaultBuffer
  # @return [ArrayBuffer] a new instance of ArrayBuffer
  #
  # source://prettier_print//lib/prettier_print.rb#302
  def initialize(output = T.unsafe(nil)); end

  # source://prettier_print//lib/prettier_print.rb#306
  def trim!; end
end

# This is the default output buffer that provides a base implementation of
# trim! that does nothing. It's effectively a wrapper around whatever output
# object was given to the format command.
#
# source://prettier_print//lib/prettier_print.rb#266
class PrettierPrint::Buffer::DefaultBuffer
  # @return [DefaultBuffer] a new instance of DefaultBuffer
  #
  # source://prettier_print//lib/prettier_print.rb#269
  def initialize(output = T.unsafe(nil)); end

  # source://prettier_print//lib/prettier_print.rb#273
  def <<(object); end

  # Returns the value of attribute output.
  #
  # source://prettier_print//lib/prettier_print.rb#267
  def output; end

  # source://prettier_print//lib/prettier_print.rb#277
  def trim!; end
end

# This is an output buffer that wraps a string output object. It provides a
# trim! method that trims off trailing whitespace from the string using
# gsub!.
#
# source://prettier_print//lib/prettier_print.rb#285
class PrettierPrint::Buffer::StringBuffer < ::PrettierPrint::Buffer::DefaultBuffer
  # @return [StringBuffer] a new instance of StringBuffer
  #
  # source://prettier_print//lib/prettier_print.rb#286
  def initialize(output = T.unsafe(nil)); end

  # source://prettier_print//lib/prettier_print.rb#290
  def trim!; end
end

# When generating spaces after a newline for indentation, by default we
# generate one space per character needed for indentation. You can change this
# behavior (for instance to use tabs) by passing a different genspace
# procedure.
#
# source://prettier_print//lib/prettier_print.rb#576
PrettierPrint::DEFAULT_GENSPACE = T.let(T.unsafe(nil), Proc)

# When printing, you can optionally specify the value that should be used
# whenever a group needs to be broken onto multiple lines. In this case the
# default is \n.
#
# source://prettier_print//lib/prettier_print.rb#570
PrettierPrint::DEFAULT_NEWLINE = T.let(T.unsafe(nil), String)

# A node in the print tree that represents a group of items which the printer
# should try to fit onto one line. This is the basic command to tell the
# printer when to break. Groups are usually nested, and the printer will try
# to fit everything on one line, but if it doesn't fit it will break the
# outermost group first and try again. It will continue breaking groups until
# everything fits (or there are no more groups to break).
#
# source://prettier_print//lib/prettier_print.rb#138
class PrettierPrint::Group
  # @return [Group] a new instance of Group
  #
  # source://prettier_print//lib/prettier_print.rb#141
  def initialize(depth, contents: T.unsafe(nil)); end

  # source://prettier_print//lib/prettier_print.rb#147
  def break; end

  # @return [Boolean]
  #
  # source://prettier_print//lib/prettier_print.rb#151
  def break?; end

  # Returns the value of attribute contents.
  #
  # source://prettier_print//lib/prettier_print.rb#139
  def contents; end

  # Returns the value of attribute depth.
  #
  # source://prettier_print//lib/prettier_print.rb#139
  def depth; end

  # source://prettier_print//lib/prettier_print.rb#155
  def pretty_print(q); end
end

# A node in the print tree that represents printing one thing if the
# surrounding group node is broken and another thing if the surrounding group
# node is flat.
#
# source://prettier_print//lib/prettier_print.rb#165
class PrettierPrint::IfBreak
  # @return [IfBreak] a new instance of IfBreak
  #
  # source://prettier_print//lib/prettier_print.rb#168
  def initialize(break_contents: T.unsafe(nil), flat_contents: T.unsafe(nil)); end

  # Returns the value of attribute break_contents.
  #
  # source://prettier_print//lib/prettier_print.rb#166
  def break_contents; end

  # Returns the value of attribute flat_contents.
  #
  # source://prettier_print//lib/prettier_print.rb#166
  def flat_contents; end

  # source://prettier_print//lib/prettier_print.rb#173
  def pretty_print(q); end
end

# A small DSL-like object used for specifying the alternative contents to be
# printed if the surrounding group doesn't break for an IfBreak node.
#
# source://prettier_print//lib/prettier_print.rb#1091
class PrettierPrint::IfBreakBuilder
  # @return [IfBreakBuilder] a new instance of IfBreakBuilder
  #
  # source://prettier_print//lib/prettier_print.rb#1094
  def initialize(builder, if_break); end

  # Returns the value of attribute builder.
  #
  # source://prettier_print//lib/prettier_print.rb#1092
  def builder; end

  # Returns the value of attribute if_break.
  #
  # source://prettier_print//lib/prettier_print.rb#1092
  def if_break; end

  # source://prettier_print//lib/prettier_print.rb#1099
  def if_flat(&block); end
end

# A node in the print tree that is a variant of the Align node that indents
# its contents by one level.
#
# source://prettier_print//lib/prettier_print.rb#189
class PrettierPrint::Indent
  # @return [Indent] a new instance of Indent
  #
  # source://prettier_print//lib/prettier_print.rb#192
  def initialize(contents: T.unsafe(nil)); end

  # Returns the value of attribute contents.
  #
  # source://prettier_print//lib/prettier_print.rb#190
  def contents; end

  # source://prettier_print//lib/prettier_print.rb#196
  def pretty_print(q); end
end

# This object represents the current level of indentation within the printer.
# It has the ability to generate new levels of indentation through the #align
# and #indent methods.
#
# source://prettier_print//lib/prettier_print.rb#488
class PrettierPrint::IndentLevel
  # @return [IndentLevel] a new instance of IndentLevel
  #
  # source://prettier_print//lib/prettier_print.rb#497
  def initialize(genspace:, value: T.unsafe(nil), length: T.unsafe(nil), queue: T.unsafe(nil), root: T.unsafe(nil)); end

  # This can accept a whole lot of different kinds of objects, due to the
  # nature of the flexibility of the Align node.
  #
  # source://prettier_print//lib/prettier_print.rb#513
  def align(n); end

  # Returns the value of attribute genspace.
  #
  # source://prettier_print//lib/prettier_print.rb#495
  def genspace; end

  # source://prettier_print//lib/prettier_print.rb#524
  def indent(part = T.unsafe(nil)); end

  # Returns the value of attribute length.
  #
  # source://prettier_print//lib/prettier_print.rb#495
  def length; end

  # Returns the value of attribute queue.
  #
  # source://prettier_print//lib/prettier_print.rb#495
  def queue; end

  # Returns the value of attribute root.
  #
  # source://prettier_print//lib/prettier_print.rb#495
  def root; end

  # Returns the value of attribute value.
  #
  # source://prettier_print//lib/prettier_print.rb#495
  def value; end
end

# source://prettier_print//lib/prettier_print.rb#490
PrettierPrint::IndentLevel::DedentPart = T.let(T.unsafe(nil), Object)

# source://prettier_print//lib/prettier_print.rb#489
PrettierPrint::IndentLevel::IndentPart = T.let(T.unsafe(nil), Object)

# source://prettier_print//lib/prettier_print.rb#493
class PrettierPrint::IndentLevel::NumberAlignPart < ::Struct
  # Returns the value of attribute n
  #
  # @return [Object] the current value of n
  def n; end

  # Sets the attribute n
  #
  # @param value [Object] the value to set the attribute n to.
  # @return [Object] the newly set value
  #
  # source://prettier_print//lib/prettier_print.rb#493
  def n=(_); end

  class << self
    def [](*_arg0); end
    def inspect; end
    def members; end
    def new(*_arg0); end
  end
end

# source://prettier_print//lib/prettier_print.rb#492
class PrettierPrint::IndentLevel::StringAlignPart < ::Struct
  # Returns the value of attribute n
  #
  # @return [Object] the current value of n
  def n; end

  # Sets the attribute n
  #
  # @param value [Object] the value to set the attribute n to.
  # @return [Object] the newly set value
  #
  # source://prettier_print//lib/prettier_print.rb#492
  def n=(_); end

  class << self
    def [](*_arg0); end
    def inspect; end
    def members; end
    def new(*_arg0); end
  end
end

# A node in the print tree that has its own special buffer for implementing
# content that should flush before any newline.
#
# Useful for implementating trailing content, as it's not always practical to
# constantly check where the line ends to avoid accidentally printing some
# content after a line suffix node.
#
# source://prettier_print//lib/prettier_print.rb#209
class PrettierPrint::LineSuffix
  # @return [LineSuffix] a new instance of LineSuffix
  #
  # source://prettier_print//lib/prettier_print.rb#214
  def initialize(priority: T.unsafe(nil), contents: T.unsafe(nil)); end

  # Returns the value of attribute contents.
  #
  # source://prettier_print//lib/prettier_print.rb#212
  def contents; end

  # source://prettier_print//lib/prettier_print.rb#219
  def pretty_print(q); end

  # Returns the value of attribute priority.
  #
  # source://prettier_print//lib/prettier_print.rb#212
  def priority; end
end

# source://prettier_print//lib/prettier_print.rb#210
PrettierPrint::LineSuffix::DEFAULT_PRIORITY = T.let(T.unsafe(nil), Integer)

# There are two modes in printing, break and flat. When we're in break mode,
# any lines will use their newline, any if-breaks will use their break
# contents, etc.
#
# source://prettier_print//lib/prettier_print.rb#581
PrettierPrint::MODE_BREAK = T.let(T.unsafe(nil), Integer)

# This is another print mode much like MODE_BREAK. When we're in flat mode, we
# attempt to print everything on one line until we either hit a broken group,
# a forced line, or the maximum width.
#
# source://prettier_print//lib/prettier_print.rb#586
PrettierPrint::MODE_FLAT = T.let(T.unsafe(nil), Integer)

# PrettierPrint::SingleLine is used by PrettierPrint.singleline_format
#
# It is passed to be similar to a PrettierPrint object itself, by responding to
# all of the same print tree node builder methods, as well as the #flush
# method.
#
# The significant difference here is that there are no line breaks in the
# output. If an IfBreak node is used, only the flat contents are printed.
# LineSuffix nodes are printed at the end of the buffer when #flush is called.
#
# source://prettier_print//lib/prettier_print.rb#349
class PrettierPrint::SingleLine
  # Create a PrettierPrint::SingleLine object
  #
  # Arguments:
  # * +output+ - String (or similar) to store rendered text. Needs to respond
  #              to '<<'.
  # * +maxwidth+ - Argument position expected to be here for compatibility.
  #                This argument is a noop.
  # * +newline+ - Argument position expected to be here for compatibility.
  #               This argument is a noop.
  #
  # @return [SingleLine] a new instance of SingleLine
  #
  # source://prettier_print//lib/prettier_print.rb#370
  def initialize(output, _maxwidth = T.unsafe(nil), _newline = T.unsafe(nil)); end

  # Here for compatibility, does nothing.
  #
  # source://prettier_print//lib/prettier_print.rb#400
  def break_parent; end

  # Appends +separator+ to the text to be output. By default +separator+ is
  # ' '
  #
  # The +width+, +indent+, and +force+ arguments are here for compatibility.
  # They are all noop arguments.
  #
  # source://prettier_print//lib/prettier_print.rb#390
  def breakable(separator = T.unsafe(nil), _width = T.unsafe(nil), indent: T.unsafe(nil), force: T.unsafe(nil)); end

  # Appends +separator+ to the output buffer. +width+ is a noop here for
  # compatibility.
  #
  # source://prettier_print//lib/prettier_print.rb#405
  def fill_breakable(separator = T.unsafe(nil), _width = T.unsafe(nil)); end

  # Flushes the line suffixes onto the output buffer.
  #
  # source://prettier_print//lib/prettier_print.rb#377
  def flush; end

  # Opens a block for grouping objects to be pretty printed.
  #
  # Arguments:
  # * +indent+ - noop argument. Present for compatibility.
  # * +open_obj+ - text appended before the &block. Default is ''
  # * +close_obj+ - text appended after the &block. Default is ''
  # * +open_width+ - noop argument. Present for compatibility.
  # * +close_width+ - noop argument. Present for compatibility.
  #
  # source://prettier_print//lib/prettier_print.rb#426
  def group(_indent = T.unsafe(nil), open_object = T.unsafe(nil), close_object = T.unsafe(nil), _open_width = T.unsafe(nil), _close_width = T.unsafe(nil)); end

  # Effectively unnecessary, but here for compatibility.
  #
  # source://prettier_print//lib/prettier_print.rb#449
  def if_break; end

  # Also effectively unnecessary, but here for compatibility.
  #
  # source://prettier_print//lib/prettier_print.rb#454
  def if_flat; end

  # A noop that immediately yields.
  #
  # source://prettier_print//lib/prettier_print.rb#458
  def indent; end

  # Changes the target output buffer to the line suffix output buffer which
  # will get flushed at the end of printing.
  #
  # source://prettier_print//lib/prettier_print.rb#464
  def line_suffix; end

  # A buffer output that wraps any calls to line_suffix that will be flushed
  # at the end of printing.
  #
  # source://prettier_print//lib/prettier_print.rb#359
  def line_suffixes; end

  # Takes +indent+ arg, but does nothing with it.
  #
  # Yields to a block.
  #
  # source://prettier_print//lib/prettier_print.rb#473
  def nest(_indent); end

  # The output object. It stores rendered text and should respond to <<.
  #
  # source://prettier_print//lib/prettier_print.rb#351
  def output; end

  # The current array of contents that the print tree builder methods should
  # append to.
  #
  # source://prettier_print//lib/prettier_print.rb#355
  def target; end

  # Add +object+ to the text to be output.
  #
  # +width+ argument is here for compatibility. It is a noop argument.
  #
  # source://prettier_print//lib/prettier_print.rb#480
  def text(object = T.unsafe(nil), _width = T.unsafe(nil)); end

  # Immediately trims the output buffer.
  #
  # source://prettier_print//lib/prettier_print.rb#410
  def trim; end
end

# A class that wraps the ability to call #if_flat. The contents of the
# #if_flat block are executed immediately, so effectively this class and the
# #if_break method that triggers it are unnecessary, but they're here to
# maintain compatibility.
#
# source://prettier_print//lib/prettier_print.rb#442
class PrettierPrint::SingleLine::IfBreakBuilder
  # source://prettier_print//lib/prettier_print.rb#443
  def if_flat; end
end

# A node in the print tree that represents plain content that cannot be broken
# up (by default this assumes strings, but it can really be anything).
#
# source://prettier_print//lib/prettier_print.rb#228
class PrettierPrint::Text
  # @return [Text] a new instance of Text
  #
  # source://prettier_print//lib/prettier_print.rb#231
  def initialize; end

  # source://prettier_print//lib/prettier_print.rb#236
  def add(object: T.unsafe(nil), width: T.unsafe(nil)); end

  # Returns the value of attribute objects.
  #
  # source://prettier_print//lib/prettier_print.rb#229
  def objects; end

  # source://prettier_print//lib/prettier_print.rb#241
  def pretty_print(q); end

  # Returns the value of attribute width.
  #
  # source://prettier_print//lib/prettier_print.rb#229
  def width; end
end

# A node in the print tree that represents trimming all of the indentation of
# the current line, in the rare case that you need to ignore the indentation
# that you've already created. This node should be placed after a Breakable.
#
# source://prettier_print//lib/prettier_print.rb#251
class PrettierPrint::Trim
  # source://prettier_print//lib/prettier_print.rb#252
  def pretty_print(q); end
end
