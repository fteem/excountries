defmodule Excountries.API do
  @url "https://restcountries.eu/rest/v1"

  def call path do
    %{ body: body, headers: _headers, status_code: status_code } = HTTPoison.get! "#{@url}#{path}"
    case status_code do
      200 -> body
      _ -> throw "Not found."
    end
  end
end
