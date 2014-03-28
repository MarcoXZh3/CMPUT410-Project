module Applications
  extend ActiveSupport::Concern

  # XXX: Javascript: 1) make sure at least one animal has been chosen
  #                  2) verify "user_id", "age", "phone", "email", "postal_code", "income" field
  #                  3) if user exists, set all fields' values to the existing values
  #                  4) display request's response (@status)
  #                  5) redirect page and update @status
  # get 'applications/adopt' => 'petshelter#app_adopt'
  def app_adopt
    prepareBaseContext
    @animals = Animal.where('stage = ?', true)
    @files = Array.new
    for a in @animals
      @files.push((AnimalFile.find_by animal: a))
    end
    @people = People.take!
    if request.method == 'POST'
      @status = 'Adoption request(s) failed'
      user = People.find_by(user_id: request.POST['user_id'])
      if user == nil
        user = People.new
        user.user_id = request.POST['user_id']
        @status = 'Adoption request(s) succeeded'
      end
      user.user_type = 'USER'
      user.name = request.POST['name']
      user.gender = request.POST['gender'].upcase
      user.age = request.POST['age']
      user.phone = request.POST['phone']
      user.email = request.POST['email']
      user.address = request.POST['address']
      user.city = request.POST['city']
      user.province = request.POST['province']
      user.postal_code = request.POST['postal_code']
      user.education = request.POST['education']
      user.occupation = request.POST['occupation']
      user.income = request.POST['income']
      user.special_skills = request.POST['special_skills']
      user.save
      for animal in @animals
        if request.POST[animal.animal_id] != nil and Adoption.find_by(people: user, animal: animal) == nil
          adoption = Adoption.new
          adoption.people = user
          adoption.animal = animal
          adoption.apply_date = Time.now.strftime('%Y-%m-%d')
          adoption.adoption_date = nil
          adoption.accepted = false
          adoption.save
          @status = 'Adoption request(s) succeeded'
        end
      end
      redirect_to action: 'app_adopt'
      return
    end # if request.method == 'POST'
    render 'petshelter/applications/adopt'
  end # def app_adopt

  # XXX: Only file uploading part is ready. Record updating need to be done
  #      Besides, you may want rename the file instead of using it's original name
  # XXX: How to allow uploading multiple files???
  # XXX: Javascript: 1) make sure at least one animal has been surrendered
  #                  2) verify "user_id", "age", "phone", "email", "postal_code", "income" field
  #                  3) if user exists, set all fields' values to the existing values
  #                  4) display request's response (@status)
  #                  5) redirect page and update @status
  # get 'applications/surrender' => 'petshelter#app_surrender'
  def app_surrender
    prepareBaseContext
    @animal = Animal.take!
    @people = People.take!
    if request.method == 'POST'
      uploaded_io = params[:photo]
      if uploaded_io != nil
        folder = ''
        if ['.jpg', '.png', '.gif', '.bmp'].include? File.extname(uploaded_io.original_filename)
          folder = 'images'
        elsif ['.wav', '.mp3', '.ogg'].include? File.extname(uploaded_io.original_filename)
          folder = 'audios'
        elsif ['.mp4', '.ogg', '.webm'].include? File.extname(uploaded_io.original_filename)
          folder = 'videos'
        end
        File.open(Rails.root.join('public', folder, uploaded_io.original_filename), 'wb') do |file|
          file.write(uploaded_io.read)
        end
      end
    end
    render 'petshelter/applications/surrender'
  end # def app_surrender

  # get 'applications/donate' => 'petshelter#app_donates'
  def app_donates
    prepareBaseContext
    @animals = Animal.where('stage = ?', true)
    @files = Array.new
    for a in @animals
      @files.push((AnimalFile.find_by animal: a))
    end
    @people = People.take!
    render 'petshelter/applications/donates'
  end # def app_donates

  # get 'applications/donate/:donate_type' => 'petshelter#app_donate'
  def app_donate
    prepareBaseContext
    @donate_type = params[:donate_type]
    @animals = Animal.where('stage = ?', true)
    @files = Array.new
    for a in @animals
      @files.push((AnimalFile.find_by animal: a))
    end
    @people = People.take!
    render 'petshelter/applications/donate'
  end # def app_donate

  # get 'applications/volunteer' => 'petshelter#app_volunteer'
  def app_volunteer
    prepareBaseContext
    @shelters = Shelter.all
    @people = People.take!
    render 'petshelter/applications/volunteer'
  end # def app_volunteer

end # ﻿module Applications

