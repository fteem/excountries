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
  * by_regional_bloc
  """

  alias Excountries.API

  @doc """
  Returns all of the countries in a list.

  ```
   Excountries.Radar.all()
  ```
  """
  def all(fields \\ nil) do
    API.call("/all", fields) |> Poison.decode!(as: [Excountries.Country])
  end

  @doc """
  Searches for a country by it's exact name:

  ```
   Excountries.Radar.by_full_name("United States Of America")
  ```
  """
  def by_full_name(name, fields \\ nil) do
    name = String.downcase name
    API.call_fulltext("/name/#{name}", fields) |> Poison.decode!(as: [Excountries.Country]) |> List.first
  end

  @doc """
  Searches for a country by a substring of it's name or abbreviation:

  ```
   Excountries.Radar.by_name("USA")
  ```
  """
  def by_name(name, fields \\ nil) do
    name = String.downcase name
    API.call("/name/#{name}", fields) |> Poison.decode!(as: [Excountries.Country])
  end

  @doc """
  Searches for a country by a language code. Language codes must be ISO 639-1 compliant.

  ```
   Excountries.Radar.by_language("en")
  ```
  """
  def by_language(lang, fields \\ nil) do
    Excountries.LanguageValidator.validate!(lang)
    API.call("/lang/#{lang}", fields) |> Poison.decode!(as: [Excountries.Country])
  end

  @doc """
  Searches for a country by currency name:

  ```
   Excountries.Radar.by_currency("USD")
  ```
  """
  def by_currency(currency, fields \\ nil) do
    API.call("/currency/#{currency}", fields) |> Poison.decode!(as: [Excountries.Country])
  end

  @doc """
  Searches for a country by it's capital city:

  ```
   Excountries.Radar.by_capital("USD")
  ```
  """
  def by_capital(capital, fields \\ nil) do
    API.call("/capital/#{capital}", fields) |> Poison.decode!(as: [Excountries.Country]) |> List.first
  end

  @doc """
  Searches for the country by it's calling code:

  ```
   Excountries.Radar.by_calling_code("01")
  ```
  """
  def by_calling_code(code, fields \\ nil) do
    API.call("/calling_code/#{code}", fields) |> Poison.decode!(as: [Excountries.Country])
  end

  @doc """
  Searches for the country by it's region:

  ```
   Excountries.Radar.by_region("Oceania")
  ```
  """
  def by_region(region, fields \\ nil) do
    API.call("/region/#{region}", fields) |> Poison.decode!(as: [Excountries.Country])
  end

  @doc """
  Searches for the country by it's subregion:

  ```
   Excountries.Radar.by_subregion("Polynesia")
  ```
  """
  def by_subregion(subregion, fields \\ nil) do
    API.call("/subregion/#{subregion}", fields) |> Poison.decode!(as: [Excountries.Country])
  end

  @doc """
  Searches for the country by it's country code:

  ```
   Excountries.Radar.by_country_code("MKD")
  ```
  """
  def by_country_code(code, fields \\ nil) do
    API.call("/alpha/#{code}", fields) |> Poison.decode!(as: [Excountries.Country])
  end

  @doc """
  Searches for the country by it's regional bloc:

  ```
   Excountries.Radar.by_regional_bloc("eu")
  ```
  """
  def by_regional_bloc(regionalbloc, fields \\ nil) do
    API.call("/regionalbloc/#{regionalbloc}", fields) |> Poison.decode!(as: [Excountries.Country])
  end
end
