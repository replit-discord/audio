package main

import (
	"encoding/binary"
	"fmt"
	"math"
	"os"

	"github.com/AllAwesome497/audio/gosamplerate"
	"github.com/AllAwesome497/audio/opus"
)

func main() {
	// data.in is mono-channel 32 bit encoded pcm data
	// at 44100htz.  We have 3456 samples.
	// We want to get it at a 22050 samplerate.

	src, err := gosamplerate.New(0, 1, 3456, 100000)
	f, err := os.Open("data.in")
	chk(err)
	chk(err)
	in := make([]float32, 3456)

	for i := 0; i < 3456; i++ {
		val := int32(0)
		err := binary.Read(f, binary.LittleEndian, &val)
		chk(err)
		in[i] = float32(val) / float32(math.MaxInt32)
	}

	err = src.SetRatio(.5)
	chk(err)

	out, err := src.Process(in, .5, true)
	chk(err)

	// Since we are downsampling to exactly half the samplerate
	// we want exactly half the samples.
	if len(out) != 1728 {
		panic(fmt.Errorf("Expected 1728 samples but got %d", len(out)))
	}
	// We're more testing that opus is there than actually using it.
	_, err = opus.NewStream(f)
	if err != opus.ErrStreamNotFormat {
		fmt.Println("Recieved incorrect error.")
		panic(err)
	}

	fmt.Println("All tests passed.")
}

func chk(err error) {
	if err != nil {
		panic(err)
	}
}
