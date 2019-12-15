# MIT License

# Copyright (c) 2019 Andre Souto

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

set -xe

CONTEXT=$1

if [ -z "$1" ]; then
  CONTEXT=$HOME/context
fi

version=$("$CONTEXT"/xsim/bin/xvhdl -version)

if [ -z "${DOCKER_TAG}" ]; then
  DOCKER_TAG=$(echo "$version" | cut -d' ' -f3)
fi

echo "DOCKER_TAG=$DOCKER_TAG"

PATH_TO_THIS_SCRIPT=$(readlink -f "$(dirname "$0")")
DOCKERFILE=$PATH_TO_THIS_SCRIPT/Dockerfile

docker build -t suoto/xsim:"$DOCKER_TAG" -f "$DOCKERFILE" "$CONTEXT"

