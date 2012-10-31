====
    Copyright 2010 Västra Götalandsregionen

      This library is free software; you can redistribute it and/or modify
      it under the terms of version 2.1 of the GNU Lesser General Public
      License as published by the Free Software Foundation.

      This library is distributed in the hope that it will be useful,
      but WITHOUT ANY WARRANTY; without even the implied warranty of
      MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
      GNU Lesser General Public License for more details.

      You should have received a copy of the GNU Lesser General Public
      License along with this library; if not, write to the
      Free Software Foundation, Inc., 59 Temple Place, Suite 330,
      Boston, MA 02111-1307  USA
====

The aui-carousel widget included in the alloy code base did not allow for a custom menu. More recent versions of the aui-carousel widget have this option enabled.

Thus, the custom replacements of these files enables a custom menu. In order for this more recent aui-carousel widget to work with the older aui code base, a line in aui-carousel.js (as well as debug and min versions) had to be changed:
	//getCN = A.getClassName,
	getCN = A.ClassNameManager.getClassName,

