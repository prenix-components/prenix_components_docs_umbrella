defmodule PrenixComponentsDocsWeb.DocsHTML do
  use PrenixComponentsDocsWeb, :html

  embed_templates "docs_html/*"
  embed_templates "docs_html/partials/*"
end
