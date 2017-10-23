defmodule Excountries.Country do
  @derive [Poison.Encoder]
  defstruct [
    :name,
    :topLevelDomain,
    :alpha2Code,
    :alpha3Code,
    :callingCodes,
    :capital,
    :altSpellings,
    :region,
    :subregion,
    :population,
    :latlng,
    :demonym,
    :area,
    :gini,
    :timezones,
    :borders,
    :nativeName,
    :numericCode,
    :currencies,
    :languages,
    :translations,
    :flag,
    :regionalBlocs,
    :cioc
  ]
end

