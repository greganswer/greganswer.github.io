# frozen_string_literal: true

Jekyll::Hooks.register :posts, :post_write do
  system('python _plugins/compile_tags.py')
end
