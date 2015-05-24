#!/usr/bin/env python
import sys



class Elf32_Ehdr():
	def toint(self, s):
		return ord(s[0]) | ord(s[1]) << 8 | ord(s[2]) << 16 | ord(s[3]) << 24
	
	def toshort(self, s):
		return ord(s[0]) | ord(s[1]) << 8

	def __init__(self, header):
		self.e_ident = header[0:16]
		size = 16 
		self.e_type = self.toshort(header[size:size+2])
		size += 2
		self.e_machine = self.toshort(header[size:size+2])
		size += 2
		self.e_version = self.toint(header[size:size+4])
		size += 4
		self.e_entry = self.toint(header[size:size+4])
		size += 4
		self.e_phoff = self.toint(header[size:size+4])
		size += 4
		self.e_shoff = self.toint(header[size:size+4])
		size += 4
		self.e_flags = self.toint(header[size:size+4])
		size += 4
		self.e_ehsize = self.toshort(header[size:size+2])
		size += 2
		self.e_phentsize = self.toshort(header[size:size+2])
		size += 2
		self.e_phnum = self.toshort(header[size:size+2])
		size += 2
		self.e_shentsize = self.toshort(header[size:size+2])
		size += 2
		self.e_shnum = self.toshort(header[size:size+2])
		size += 2
		self.e_shsrndx = self.toshort(header[size:size+2])
		size += 2
		self.size = size

	def show(self):
		print ">> header size %d" % self.size
		print "section header offset: %d " % self.e_shoff
		print "size section headers: %d " % self.e_shentsize
		print "num of section headers: %d " % self.e_shnum
		print "section header string table index: %d " % self.e_shsrndx
		print

class Elf32_Phdr():
	def toint(self, s):
		return ord(s[0]) | ord(s[1]) << 8 | ord(s[2]) << 16 | ord(s[3]) << 24
	
	def toshort(self, s):
		return ord(s[0]) | ord(s[1]) << 8

	def __init__(self, s):
		size = 0
		self.p_type = self.toint(s[size:size+4])
		size += 4
		self.p_offset = self.toint(s[size:size+4])
		size += 4
		self.p_vaddr = self.toint(s[size:size+4])
		size += 4
		self.p_filesz = self.toint(s[size:size+4])
		size += 4
		self.p_memsz = self.toint(s[size:size+4])
		size += 4
		self.p_flags = self.toint(s[size:size+4])
		size += 4
		self.p_align = self.toint(s[size:size+4])
		size += 4
		self.size = size
	
class Elf32_Shdr():
	
	SHT_STRTAB = 3
	
	def toint(self, s):
		return ord(s[0]) | ord(s[1]) << 8 | ord(s[2]) << 16 | ord(s[3]) << 24
	
	def toshort(self, s):
		return ord(s[0]) | ord(s[1]) << 8

	def __init__(self, s):
		size = 0

		self.sh_name = self.toint(s[size:size+4])
		size += 4
		self.sh_type = self.toint(s[size:size+4])
		size += 4
		self.sh_flags = self.toint(s[size:size+4])
		size += 4
		self.sh_addr = self.toint(s[size:size+4])
		size += 4
		self.sh_offset = self.toint(s[size:size+4])
		size += 4
		self.sh_size = self.toint(s[size:size+4])
		size += 4
		self.sh_link = self.toint(s[size:size+4])
		size += 4
		self.sh_info = self.toint(s[size:size+4])
		size += 4
		self.sh_addralign = self.toint(s[size:size+4])
		size += 4
		self.sh_entsize = self.toint(s[size:size+4])
		size += 4

		self.size = size

	def show(self):
		print "name: ", self.sh_name
		print "type      %x" % self.sh_type
		print "flags     %x" % self.sh_flags
		print "addr      %x" % self.sh_addr
		print "offset    %x" % self.sh_offset
		print "size      %x" % self.sh_size
		print "link      %x" % self.sh_link
		print "info      %x" % self.sh_info
		print "addralign %x" % self.sh_addralign
		print "entsize   %x" % self.sh_entsize
		print

class SymName():
	def __init__(self, s):
		self.s = s
	
	def getName(self, index):
		end = self.s.find("\x00", index)
		return self.s[index:end]



if __name__ == "__main__":
	f = open(sys.argv[1])
	d = f.read()

	eh = Elf32_Ehdr(d)
	eh.show()

	shlist = [0] * eh.e_shnum
	offset = eh.e_shoff
	for i in range(eh.e_shnum):
		shlist[i] = Elf32_Shdr(d[offset:])
		offset += eh.e_shentsize
		shlist[i].show()

	strtab = shlist[eh.e_shsrndx]

	symn = SymName(d[strtab.sh_offset:strtab.sh_offset+strtab.sh_size])
	for s in shlist:
		s.sh_name = symn.getName(s.sh_name)
		s.show()


