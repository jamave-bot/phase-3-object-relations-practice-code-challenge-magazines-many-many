class Magazine < ActiveRecord::Base
    has_many :subscriptions
    has_many :readers, through: :subscriptions

    def email_list
        self.readers.pluck(:email).join(";")
    end

    def self.most_popular #find a method for this shit damn
        highest_subs = 0
        most_popular_mag = nil

        self.all.each do |mag|
            mag_count = mag.subscriptions.count
            if mag_count > highest_subs
                highest_subs = mag_count
                most_popular_mag = mag
            end
        end
        most_popular_mag
    end


end