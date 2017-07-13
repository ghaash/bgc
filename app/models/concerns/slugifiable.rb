 module Slugifiable

   module InstanceMethods

     def slug
       if !!self.username
         self.username.gsub(" ", "-").downcase
       end
     end

   end

   module ClassMethods

     def find_by_slug(slug)
       self.all.find { |object| object.slug == slug}
     end

   end
 end

#to use a slug, use find_by_slug and will represent board games as games/takenoko instaed of games/1 and users, well anything you apply it to
