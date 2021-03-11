class Backer
    attr_accessor :name 

    @@all = []

    def initialize(name)
        @name = name
        save
    end

    def save
        @@all << self
    end

    def back_project(project)
        ProjectBacker.new(project, self)
    end

    def backed_projects
        project_backers = ProjectBacker.all.select {|project| project.backer == self}

        project_backers.map do |project_backer|
            project_backer.project
        end
    end
end