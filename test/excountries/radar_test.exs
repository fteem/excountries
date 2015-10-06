defmodule Excountries.RadarTest do
  use ExUnit.Case

  defmodule ClientMock do
    def call(_path) do
      ~s(
      [
        {
          "name": "Republic of Macedonia",
          "capital": "Skopje",
          "altSpellings": [
            "MK",
            "Republic of Macedonia",
            "Република Македонија"
          ],
          "relevance": "0",
          "region": "Europe",
          "subregion": "Southern Europe",
          "translations": {
            "de": "Mazedonien",
            "es": "Macedonia",
            "fr": "Macédoine",
            "ja": "マケドニア旧ユーゴスラビア共和国",
            "it": "Macedonia"
          },
          "population": 2058539,
          "latlng": [
            41.83333333,
            22
          ],
          "demonym": "Macedonian",
          "area": 25713,
          "gini": 43.2,
          "timezones": [
            "UTC+01:00"
          ],
          "borders": [
            "ALB",
            "BGR",
            "GRC",
            "KOS",
            "SRB"
          ],
          "nativeName": "Македонија",
          "callingCodes": [
            "389"
          ],
          "topLevelDomain": [
            ".mk"
          ],
          "alpha2Code": "MK",
          "alpha3Code": "MKD",
          "currencies": [
            "MKD"
          ],
          "languages": [
            "mk"
          ]
        }
      ]
      )
    end
  end

  test ".all returns a list of Country structs" do
    countries = Excountries.Radar.all(ClientMock)
    country = List.first countries
    assert country.name, "Republic Of Macedonia" 
    assert country.capital, "Skopje"
    assert country.region, "Europe"
    assert country.relevance, "0"
  end

  test ".by_full_name returns the matching Country" do
    country = Excountries.Radar.by_full_name("Republic Of Macedonia", ClientMock)
    assert country.name, "Republic Of Macedonia" 
    assert country.capital, "Skopje" 
  end

  test ".by_language returns the countries where the language is spoken" do
    countries = Excountries.Radar.by_language("mk", ClientMock)
    country = List.first countries
    assert country.name, "Republic Of Macedonia" 
    assert List.first(country.languages), "mk"
  end

  test ".by_currency returns the countries where the currency is used" do
    countries = Excountries.Radar.by_currency("MKD", ClientMock)
    country = List.first countries
    assert country.name, "Republic Of Macedonia" 
    assert List.first(country.currencies), "MKD"
  end

  test ".by_capital returns the country whose capital matches the name" do
    country = Excountries.Radar.by_capital("Skopje", ClientMock)
    assert country.name, "Republic Of Macedonia" 
    assert country.capital, "Skopje"
  end
end
