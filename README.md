# inline_partial

**inline_partial** is a Rails helper that lets you define reusable, private ERB partials inline — without creating extra files.

## Installation

Add the following line to your `Gemfile`:

```ruby
gem "inline_partial"
```

Then run:

```bash
bundle install
```

Or, you can add it directly with:

```bash
bundle add inline_partial
```

## Usage

You can define a reusable ERB partial directly in your view:

```erb
<% inline_partial(:foo) do %>
  <p>Foo content</p>
<% end %>

<%= render_inline_partial :foo %>
```

This example defines a partial template named `:user_row`. You can define inline partials with **any name**, using either a **symbol** or a **string**.

```erb
<% inline_partial(:user_row) do |user| %>
  <tr>
    <td><%= user.name %></td>
    <td><%= user.email %></td>
  </tr>
<% end %>
```

You can then render this partial with a single object.

```erb
<%= render_inline_partial :user_row, @user %>
```

When calling multiple items, be sure to specify the `collection` option.

```erb
<table>
  <%= render_inline_partial :user_row, collection: @users %>
</table>
```

You can also define inline partials that take string arguments or HTML-safe content.

```erb
<% inline_partial(:plain_text) { |msg| %><p><%= msg %></p><% } %>
<% inline_partial(:html_safe)  { |msg| %><div><%= raw(msg) %></div><% } %>

<%= render_inline_partial :plain_text, "hello" %>
<%= render_inline_partial :html_safe, "<b>hello</b>" %>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/lef237/inline_partial. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/lef237/inline_partial/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the InlinePartial project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/lef237/inline_partial/blob/main/CODE_OF_CONDUCT.md).
