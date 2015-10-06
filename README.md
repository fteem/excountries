Excountries
===========

![](https://img.shields.io/hexpm/dt/excountries.svg) ![](https://img.shields.io/hexpm/v/excountries.svg)
This is a tiny [Elixir](http://elixir-lang.org) wrapper for the [REST Countries API](http://restcountries.eu/).

## Installation

First, add Excountries to your `mix.exs` dependencies:

```elixir
def deps do
  [{:excountries, "~> 0.0.1"}]
end
```

and run `$ mix deps.get`. 

## Usage

There are multiple functions via which one can search for countries in the API.
Each function returns a single or a list of ```Country``` structs.

### Get all

Returns a list of countries.
```elixir
 Excountries.Radar.all()
```

### Name

Searches for a country by it's exact name:
```elixir
 Excountries.Radar.by_full_name("United States Of America")
```

Searches for a country by a substring of it's name or abbreviation:
```elixir
 Excountries.Radar.by_name("USA")
```

### Language

Searches for a country by a language code:

```elixir
 Excountries.Radar.by_language("en")
```
Language codes must be ISO 639-1 compliant. If not, throws error.

### Currency

Searches for a country by currency name:

```elixir
 Excountries.Radar.by_currency("USD")
```

### Capital city

Searches for the country by it's capital city:

```elixir
 Excountries.Radar.by_capital("USD")
```

### Calling code

Searches for the country by it's calling code:

```elixir
 Excountries.Radar.by_calling_code("01")
```

### Region 

Searches for the country by it's region:

```elixir
 Excountries.Radar.by_region("Oceania")
```

### Subregion 

Searches for the country by it's subregion:

```elixir
 Excountries.Radar.by_subregion("Polynesia")
```

### Country code

Searches for the country by it's country code:

```elixir
 Excountries.Radar.by_country_code("MKD")
```

## ```Country```

```%Excountries.Country``` is a struct containing multiple properties:

  - name
  - capital
  - relevance
  - region
  - subregion
  - population
  - latitude
  - longitude
  - demonym
  - area
  - timezones
  - nativeName
  - topLevelDomain
  - currencies
  - languages

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

  Copyright © 2015 Ilija Eftimov <ileeftimov@gmail.com>

  This work is free. You can redistribute it and/or modify it under the
  terms of the MIT License. See the LICENSE file for more details.
