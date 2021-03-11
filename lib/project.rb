class Project
    attr_accessor :title

    @@all = []

    def initialize(title)
        @title = title
        save
    end

    def save
        @@all << self
    end

    def add_backer(backer)
        ProjectBacker.new(self, backer)
    end

    def backers 
        project_backers = ProjectBacker.all.select {|project| project.project == self}

        project_backers.map do |project|
            project.backer
        end
    end
end