#! /bin/sh
# Copyright (C) 2017 Red Hat, Inc.
# This file is part of elfutils.
#
# This file is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
#
# elfutils is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

. $srcdir/test-subr.sh

if test -n "$ELFUTILS_MEMORY_SANITIZER"; then
  echo "binaries linked with memory sanitizer are too big"
  exit 77
fi

# Make sure varlocs doesn't crash, doesn't trigger self-check/asserts
# or leaks running under valgrind.
testrun_on_self_exe ${abs_top_builddir}/tests/varlocs -e
testrun_on_self_lib ${abs_top_builddir}/tests/varlocs -e
testrun_on_self_obj ${abs_top_builddir}/tests/varlocs --exprlocs -e
