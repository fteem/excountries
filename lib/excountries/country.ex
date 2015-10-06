defmodule Excountries.Country do
  @derive [Poison.Encoder]
  defstruct [:name, :capital, :relevance, :region, :subregion, :population,
    :latitude, :longitude, :demonym, :area, :timezones, :nativeName, :topLevelDomain, 
    :currencies, :languages]
end

