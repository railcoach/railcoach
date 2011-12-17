module Tracer
  def self.included(klass)
    instance_methods = klass.public_instance_methods(false)
    instance_methods.each do method
      self.hook_method(klass,method)
    end 
  end
  def self.hook_method(klass, method)
    klass.class_eval do
      alias_method "old_#{method}", "#{method}"
      define_method(method) do *args
        puts "#{method} called" + " with #{args.join(',')}" unless args.nil?
        value = self.send("old_#{method}",*args)
        puts "#{method} returned #{value}" unless value.nil?
        variables = []
        self.instance_variables.each do variable
          variables << "#{variable} = #{self.instance_variable_get(variable)}"
        end
        puts "instance variables - #{variables.join(',')}"
        return value
      end
    end   
  end
end