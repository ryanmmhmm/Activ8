class SettingDefaultsForCategories < ActiveRecord::Migration
  def change
    change_column_default(:categories, :athletic, false)
    change_column_default(:categories, :sporting_event, false)
    change_column_default(:categories, :night_life, false)
    change_column_default(:categories, :general, false)
    change_column_default(:categories, :other, false)
    change_column_default(:categories, :random, false)
    change_column_default(:categories, :food, false)
    change_column_default(:categories, :drink, false)
    change_column_default(:categories, :music, false)
    change_column_default(:categories, :game, false)
    change_column_default(:categories, :information, false)
    change_column_default(:categories, :art, false)
    change_column_default(:categories, :technology, false)
    change_column_default(:categories, :deal, false)

  end
end
