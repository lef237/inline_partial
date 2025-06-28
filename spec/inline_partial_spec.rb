# frozen_string_literal: true

RSpec.describe InlinePartial do
  include InlinePartial::Helper

  # Mock ActionView's capture and concat methods for testing
  def capture(*args, &block)
    @_captured_output = ""
    block.call(*args) if block
    @_captured_output
  end

  def concat(string)
    @_captured_output ||= ""
    @_captured_output += string.to_s
  end

  # Mock ActionView's safe_join method for testing
  def safe_join(array)
    array.join
  end

  it "renders inline partial" do
    inline_partial(:hello) { |name| concat "Hi #{name}" }
    expect(render_inline_partial(:hello, "Ruby")).to eq "Hi Ruby"
  end

  it "renders inline partial with collection" do
    inline_partial(:item) { |name| concat "- #{name}\n" }
    result = render_inline_partial(:item, collection: ["Apple", "Banana", "Cherry"])
    expect(result).to eq "- Apple\n- Banana\n- Cherry\n"
  end

  it "calling inline_partial without block does nothing useful" do
    result = inline_partial(:useless)
    expect(result).to be_nil

    expect { render_inline_partial(:useless) }.to raise_error(ArgumentError, /not found/)
  end
end
