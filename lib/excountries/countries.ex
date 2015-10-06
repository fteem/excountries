defmodule Excountries.Countries do
  def all do
    %HTTPoison.Response{body: body, headers: _headers, status_code: _status_code} = HTTPoison.get! url()
    Poison.decode! body, as: [Excountries.Country]
  end
  defp url do
    "https://restcountries.eu/rest/v1/all"
  end
end
