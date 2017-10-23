defmodule Excountries.API do
  @url "https://restcountries.eu/rest/v2"

  def call(path, fields) do
    %{ body: body, headers: _headers, status_code: status_code } =
      case fields == nil do
        true ->
          HTTPoison.get!("#{@url}#{path}")
        false ->
          HTTPoison.get!("#{@url}#{path}", [], [params: [{"fields", fields}]])
      end
    case status_code do
      200 -> body
      _ -> throw "Not found."
    end
  end

  def call_fulltext(path, fields) do
    %{ body: body, headers: _headers, status_code: status_code } =
      case fields == nil do
        true ->
          HTTPoison.get!("#{@url}#{path}", [], [params: [{"fullText", true}]])
        false ->
          HTTPoison.get!("#{@url}#{path}", [], [params: [{"fullText", true}, {"fields", fields}]])
      end
    case status_code do
      200 -> body
      _ -> throw "Not found."
    end
  end
end
