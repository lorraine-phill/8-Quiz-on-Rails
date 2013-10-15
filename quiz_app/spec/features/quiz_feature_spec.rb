require 'spec_helper'

	def create_quiz(sometitle)
		Quiz.create(:title => sometitle)
	end

	describe 'the quizzes section' do

	before(:all) do
    	create_quiz 'Some quiz'
  	end

		describe '/quizzes' do
			it 'should display quizzes' do
				visit '/quizzes'
				expect(page).to have_content 'Some quiz'	
			end	
		end

		describe 'an individual quiz' do
			it 'has its own page' do
				visit '/quizzes'
				click_link 'Some quiz'
				# expect(current_path).to have '/quizzes/1' or '/quizzes/2'
				expect(page).to have_css 'h1', text: 'Some quiz'
			end
		end		

		describe 'new quiz form' do
		    it 'creates a new quiz' do
		      visit '/quizzes/new'

			      within '.new_quiz' do
			        fill_in 'Title', with: 'Brand new quiz'
			        fill_in 'Question', with: 'What is your name?'
			        click_button "Create Quiz"
			      end

		      expect(current_url).to eq url_for(Quiz.last)
		      expect(page).to have_content 'Brand new quiz'
		      expect(page).to have_content 'What is your name?'
		    end
		  end

		 describe 'new quiz form' do
		     it 'should display a flash message if title field blank' do
		      visit '/quizzes/new'

		      within '.new_quiz' do
		        fill_in 'Question', with: 'What is your name?'
		        click_button "Create Quiz"
		      end
				# expect(current_path).to match  /\/quizzes\/\d+/
				expect(current_path).to eq '/quizzes'
				expect(page).to have_content 'Title can\'t be blank'
		    end

		    it 'can create new answers' do
		    	visit '/quizzes/new'

		      	within '.new_quiz' do
			        fill_in 'Title', with: 'Brand new quiz'
		       		fill_in 'Question', with: 'What is your name?'
		       		fill_in 'Answer', with: 'Lorraine', match: :first

		     		click_button "Create Quiz"
		     	end

	     		expect(page).to have_content 'Lorraine'
		    end

		  end

		# describe 'new quiz form' do
	 #     it 'creates a new quiz from title and questions' do
	 #      visit '/quizzes/new'

	 #      within '.new_quiz' do
	 #        fill_in 'Title', with: 'Brand new quiz 2'
	 #        fill_in 'Question', with: 'Whats your name?'
	 #        click_button "Create Quiz"
	 #      end

	 #      expect(page).to have_content 'What is your name?'
	 #      expect(page).to have_content 'Brand new quiz'
	 #      expect(Quiz.last.questions).not_to be_empty
	 #      expect(current_url).to eq url_for(Quiz.last)

	 #    end
	 #  end
end