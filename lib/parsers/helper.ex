defmodule ElixirFeedParser.Parsers.Helper do
  alias ElixirFeedParser.XmlNode

  require Logger

  def element(node, selector) do
    node |> XmlNode.find(selector) |> XmlNode.text()
  end

  def element(node, selector, attr: attr) do
    node |> XmlNode.find(selector) |> XmlNode.attr(attr)
  end

  def elements(node, selector) do
    node |> XmlNode.map_children(selector, fn e -> XmlNode.text(e) end)
  end

  def elements(node, selector, attr: attr) do
    node |> XmlNode.map_children(selector, fn e -> XmlNode.attr(e, attr) end)
  end

  def to_date_time(_, _), do: nil
end
