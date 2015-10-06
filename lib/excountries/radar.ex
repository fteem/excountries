defmodule Excountries.Radar do
  @moduledoc """
  ```Excountries.Radar``` module contains functions which are used as a fence from the
  actual API calls.

  Available methods:
  * all
  * by_full_name
  * by_name
  * by_language
  * by_currency
  * by_capital
  * by_calling_code
  * by_country_code
  * by_region
  * by_subregion
  """

  @doc """
  Returns all of the countries in a list.

  ```
   Excountries.Radar.all()
  ```
  """
  def all(client \\ Excountries.API) do
    client.call("/all") |> Poison.decode!(as: [Excountries.Country])
  end

  @doc """
  Searches for a country by it's exact name:

  ```
   Excountries.Radar.by_full_name("United States Of America")
  ```
  """
  def by_full_name(name, client \\ Excountries.API) do
    name = String.downcase name
    client.call("/name/#{name}?fullText=true") |> Poison.decode!(as: [Excountries.Country]) |> List.first
  end
  
  @doc """
  Searches for a country by a substring of it's name or abbreviation:

  ```
   Excountries.Radar.by_name("USA")
  ```
  """
  def by_name(name, client \\ Excountries.API) do
    name = String.downcase name
    client.call("/name/#{name}") |> Poison.decode!(as: [Excountries.Country])
  end

  @doc """
  Searches for a country by a language code. Language codes must be ISO 639-1 compliant.

  ```
   Excountries.Radar.by_language("en")
  ```
  """
  def by_language(lang, client \\ Excountries.API) do
    Excountries.LanguageValidator.validate!(lang) 
    client.call("/lang/#{lang}") |> Poison.decode!(as: [Excountries.Country])
  end

  @doc """
  Searches for a country by currency name:

  ```
   Excountries.Radar.by_currency("USD")
  ```
  """
  def by_currency(currency, client \\ Excountries.API) do
    client.call("/currency/#{currency}") |> Poison.decode!(as: [Excountries.Country])
  end

  @doc """
  Searches for a country by it's capital city:

  ```
   Excountries.Radar.by_capital("USD")
  ```
  """
  def by_capital(capital, client \\ Excountries.API) do
    client.call("/capital/#{capital}") |> Poison.decode!(as: [Excountries.Country]) |> List.first
  end

  @doc """
  Searches for the country by it's calling code:

  ```
   Excountries.Radar.by_calling_code("01")
  ```
  """
  def by_calling_code(code, client \\ Excountries.API) do
    client.call("/calling_code/#{code}") |> Poison.decode!(as: [Excountries.Country])
  end

  @doc """
  Searches for the country by it's region:

  ```
   Excountries.Radar.by_region("Oceania")
  ```
  """
  def by_region(region, client \\ Excountries.API) do
    client.call("/region/#{region}") |> Poison.decode!(as: [Excountries.Country])
  end

  @doc """
  Searches for the country by it's subregion:

  ```
   Excountries.Radar.by_subregion("Polynesia")
  ```
  """
  def by_subregion(subregion, client \\ Excountries.API) do
    client.call("/subregion/#{subregion}") |> Poison.decode!(as: [Excountries.Country])
  end

  @doc """
  Searches for the country by it's country code:

  ```
   Excountries.Radar.by_country_code("MKD")
  ```
  """
  def by_country_code(code, client \\ Excountries.API) do
    client.call("/alpha/#{code}") |> Poison.decode!(as: [Excountries.Country])
  end
end
