Machinist-Caching
=================

*Machinist with the object-caching feature*

When you create an object with make!, Machinist-caching keeps the object around in the database. If, in a later test, you request an identical object, Machinist will give you the cached copy.
This is a big performance win, particularly when creating objects in the setup for a group of tests.

## Installation

    gem install machinist-caching

## Require

    require 'machinist-caching'
    require 'machinist/caching/active_record'

## Problem Scenario

Imagine that you have countries, states and cities model. And you have this blueprints:

    Country.blueprint(:brasil) do
	  name { 'Brasil sil sil!!' }
	end
	
	State.blueprint(:minas_gerais) do
	  acronym { 'MG' }
	  name    { 'Minas Gerais' }
	  country { Country.make!(:brasil) }
	end
	
	State.blueprint(:rio_grande_do_sul) do
	  acronym { 'RS' }
	  name    { 'Rio Grande do Sul' }
	  country { Country.make!(:brasil) }
	end

	City.blueprint(:belo_horizonte) do
	  digit { 1 }
	  name  { 'Belo Horizonte' }
	  state { State.make!(:minas_gerais) }
	end

	City.blueprint(:porto_alegre) do
	  digit { 1 }
	  name  { 'Porto Alegre' }
	  state { State.make!(:rio_grande_do_sul) }
	end

And you have some validations in the models:

    class Country < ActiveRecord::Base
      validates :name, presence: true, uniqueness: { allow_blank: true }
    end

    class State < ActiveRecord::Base
      validates :name, presence: true, uniqueness: { allow_blank: true }
    end

    class City < ActiveRecord::Base
      validates :name, presence: true, uniqueness: { allow_blank: true }
    end

### Instead of you writing this to create a city

    brasil = Country.make!(:brasil)

    minas_gerais = State.make!(:minas_gerais, country: brasil)
    rio_grande_do_sul = State.make!(:rio_grande_do_sul, country: brasil)

    City.make!(:belo_horizonte, state: minas_gerais)
    City.make!(:porto_alegre, state: rio_grande_do_sul)

### With **machinist-caching** you can do this:

    City.make!(:belo_horizonte)
    City.make!(:porto_alegre)

### Profit!

:)