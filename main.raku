#!/usr/bin/env raku

my $separator = '-----';
my $number-regex = / \-?\d+[\.\d+]? /;

sub MAIN(
  Str $file,
  Int :$num-frames = 8
) {
        # Harvest first and last frames from file.
    if $num-frames < 2 { die 'Error: Two or more frames needed.'; }
    my $content = slurp $file;
    my @parts = $content.split($separator);
    if @parts.elems != 2 { die 'Error: No separator in source file.'; }
    my @frames;
    @frames[0]     = @[@parts[0] ~~ m:g/ $number-regex /]».Num;
    my @last-frame = @[@parts[1] ~~ m:g/ $number-regex /]».Num;
    if @frames[0].elems != @last-frame.elems {
        die 'Error: Start and end frames must have the same amount of numbers.';
    }

        # Create and add interpolated frames.
    if $num-frames > 2 {
        my $num-interpolations = $num-frames - 2;

            # Get step size of each frame element.
        my @step-sizes;
        for ^(@frames[0].elems) -> $i {
            my $distance = @last-frame[$i] - @frames[0][$i];
            my $step-size = $distance / ($num-interpolations + 1);
            @step-sizes.push: $step-size;
        }

            # Interpolate!
        for ^$num-interpolations {
            my @new-frame;
            for @frames[@frames.end].kv -> $k, $v {
                @new-frame.push: $v + @step-sizes[$k];
            }
            @frames.push: @new-frame;
        }
    }
    @frames.push: @last-frame;

         # Create files.
    my $template = @parts[0];
    for @frames.kv -> $i, @frame { # @frame is replacements.
        my $new-text = replace-numbers($template, @frame);
        spurt "path_{$i+1}.txt", $new-text.trim ~ "\n";
    }
}

sub replace-numbers ($text, @number-replacements) {
    return sprintf
        $text.subst($number-regex, '%s', :g),
        | @number-replacements,
    ;
}
