namespace :generate_database do
  desc "Generate the database"
  task :execute => :environment do
    main
  end

  def main
    unless Rails.env.production?
    	# User
    	p "===================== Create User ====================="
    	User.create(
			first_name: "Demo",
			last_name: "User",
			email: "demo@example.com",
			password: "Th@nhNguy3n",
			phone: Faker::PhoneNumber.phone_number,
			address: "#{Faker::Address.city} #{Faker::Address.street_address}"
		)
    	5.times do
    		user = User.new(
    			first_name: Faker::Name.first_name,
    			last_name: Faker::Name.last_name,
    			email: Faker::Internet.free_email,
    			password: "Th@nhNguy3n",
    			phone: Faker::PhoneNumber.phone_number,
    			address: "#{Faker::Address.city} #{Faker::Address.street_address}"
			)
			if user.valid?
    			user.save()
    		else 
    			p user.errors.full_messages
    		end
    	end

    	# Publisher
    	p "===================== Create Publisher ====================="
    	30.times do
    		publisher = Publisher.new(
    			name: Faker::Book.publisher, 
    			phone: Faker::PhoneNumber.cell_phone, 
    			address: "#{Faker::Address.city} #{Faker::Address.street_address}",
    			description: Faker::Hipster.paragraph,
			)
			if publisher.valid?
    			publisher.save()
    		else 
    			p publisher.errors.full_messages
    		end
    	end

    	# Author
    	p "===================== Create Author ====================="
    	50.times do
    		author = Author.new(
    			first_name: Faker::Name.first_name,
    			last_name: Faker::Name.last_name,
                gender: Faker::Number.between(from: 0, to:1),
    			email: Faker::Internet.free_email,
    			phone: Faker::PhoneNumber.phone_number,
    			address: "#{Faker::Address.city} #{Faker::Address.street_address}",
    			biography: Faker::Hipster.paragraph,
			)
			if author.valid?
    			author.save()
    		else 
    			p author.errors.full_messages
    		end
    	end

        # BookCategory
        p "===================== Create BookCategory ====================="
        10.times do
            category = BookCategory.new(
                name: Faker::Book.genre, 
                description: Faker::Hipster.paragraph,
            )
            if category.valid?
                category.save()
            else 
                p category.errors.full_messages
            end
        end

    	# Book
    	p "===================== Create Book ====================="
    	100.times do
    		book = Book.new(
                book_category_id: Faker::Number.between(from: 1, to:10),
    			author_id: Faker::Number.between(from: 1, to:50),
    			publisher_id: Faker::Number.between(from:1, to: 30),
    			title: Faker::Book.title,
    			edition_number: Faker::Number.number(digits: 5),
    			copyright: Faker::Hipster.sentence,
    			description: Faker::Hipster.paragraph,
    			price: Faker::Commerce.price,
    			quantity: Faker::Number.between(from:1, to:10000)
    		)
    		if book.valid?
    			book.save()
    		else 
    			p book.errors.full_messages
    		end
    	end
    end
  end

end
