require 'pathname'

module RecipeHelper
  def include_role(name)
    include_role_or_cookbook(name, "role")
  end

  def include_cookbook(name)
    include_role_or_cookbook(name, "cookbook")
  end

  def include_role_or_cookbook(name, type)
    Pathname.new(File.dirname(@recipe.path)).ascend do |dir|
      names = name.split("::")
      names << "default" if names.length == 1
      names[-1] += ".rb"
      if type == "cookbook"
        recipe_file = dir.join("cookbooks", *names)
      else
        recipe_file = dir.join(*names)
      end
      if recipe_file.exist?
        include_recipe(recipe_file.to_s)
        return
      end
    end

    raise "#{type.capitalize} #{name} is not found."
  end
end

Itamae::Recipe::EvalContext.include(RecipeHelper)

include_recipe File.join("roles", node[:role], "default.rb")
