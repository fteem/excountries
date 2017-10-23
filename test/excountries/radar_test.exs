defmodule Excountries.RadarTest do
  use ExUnit.Case

  test ".all returns a list of Country structs" do
    countries =
      Excountries.Radar.all("alpha2Code;capital")
      |> Enum.filter(fn x -> x["alpha2Code"] == "MK" end)
      |> List.first()
    assert countries["capital"], "Skopje"
  end

  test ".by_full_name returns the matching Country" do
    country = Excountries.Radar.by_full_name("Spain")
    assert country["capital"], "Madrid"
  end

  test ".by_language returns the countries where the language is spoken" do
    countries = Excountries.Radar.by_language("mk")
    country = List.first countries
    assert country["name"], "Macedonia (the former Yugoslav Republic of)"
  end

  test ".by_currency returns the countries where the currency is used" do
    countries = Excountries.Radar.by_currency("MKD")
    country = List.first countries
    assert country["name"], "Macedonia (the former Yugoslav Republic of)"
  end

  test ".by_capital returns the country whose capital matches the name" do
    country = Excountries.Radar.by_capital("Skopje")
    assert country["name"], "Macedonia (the former Yugoslav Republic of)"
  end

  test ".by_regional_bloc returns the country whose regional bloc matches the name" do
    country =
      Excountries.Radar.by_regional_bloc("eu")
      |> Enum.filter(fn x -> x["alpha2Code"] == "ES" end)
      |> List.first()
    assert country["name"], "Spain"
  end

  test "with filter returns the country fields whose regional bloc matches the name" do
    country =
      Excountries.Radar.by_regional_bloc("eu", "name;alpha2Code;capital")
      |> Enum.filter(fn x -> x["alpha2Code"] == "ES" end)
      |> List.first()
    assert country["name"], "Spain"
  end
end
