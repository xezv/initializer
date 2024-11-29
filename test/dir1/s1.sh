echo "s1"

echo "s1's pwd: $(pwd)"
echo "s1's PWD: ${PWD}"
echo "s1's dir: ${BASH_SOURCE[0]}"
echo "s1's dir: ${BASH_SOURCE[1]}"
echo "s1's dir: $(dirname "${BASH_SOURCE[0]}")"
echo "s1's dir: $(dirname "${BASH_SOURCE[1]}")"
