# redMine - project management software
# Copyright (C) 2006-2007  Jean-Philippe Lang
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

module MailmanWrapper
  def self.create_list(list)
    cmd = "newlist --emailhost=#{Setting.mailing_lists_domain} --quiet #{list.name} #{list.admin.mail} #{list.password}"
    puts "Shelling out: #{cmd}"    
    system(cmd) && $? && $?.exitstatus == 0 ? true : false
  end
  
  def self.destroy_list(list)
    cmd = "rmlist #{list.name}"
    puts "Shelling out: #{cmd}"
    system(cmd) && $? && $?.exitstatus == 0 ? true : false
  end
end