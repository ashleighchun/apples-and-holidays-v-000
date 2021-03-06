require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  holiday_supplies[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_supplies.each do |season, holidays_hash|
   holidays_hash.each do |attribute, data|
     if attribute == :christmas || :new_years
       data << "Balloons"
      end
    end
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_supplies.each do |season, holiday_hash|
   holiday_hash.each do |attribute, data|
     if attribute == :memorial_day
       data << supply
       
      end
    end
  end
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season][holiday_name] = supply_array  
  holiday_hash
end



def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
holiday_hash[:winter].values.flatten

end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
holiday_supplies.each do |season, holidays|
  puts "#{season.capitalize}:"
   holidays.each do |attribute, data|
    x = attribute.to_s
    x = x.split("_")
    x = x.map(&:capitalize)
    x = x.join(" ")
    #x = x.capitalize
    #binding.pry
  puts "  #{x}: #{data.join(", ")}"
  end
 end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  bbq_holidays = []
  holiday_supplies.each do |season, holidays|
    holidays.each do |attribute, data|
      if data.include?("BBQ")
        bbq_holidays << attribute
        #binding.pry
      end
      
    end
  end
  return bbq_holidays
end








