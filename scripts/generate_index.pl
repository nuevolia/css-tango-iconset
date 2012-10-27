#!/usr/bin/perl -w

my %cl = ();
my $first = 0;

while (<>) {
	chomp;
	my $class = $_;
	my @type = split '-' => $class;
	
	unless (exists $cl{$type[0]}) {
		$cl{$type[0]} = 1;
		end_table() if $first++;
		start_table($type[0]);
	}
	print_class($class);
	
}
end_table() if $first;

sub start_table {
	my $type = ucfirst( shift );
	print "<h3>$type</h3>
	<table class=\"table table-bordered\">
	<caption>$type</caption>
	<thead>
	<tr>
	<th>class</th>
	<th>small</th>
	<th>large</th>
	<th>xlarge</th>
	</tr>
	</thead>
	<tbody>\n"
}

sub end_table {
	print "</tbody>
	</table>\n\n";
}

sub print_class {
	my $class = shift;
	
	printf "
	\t<!-- classname : $class -->
	\t<tr>
	\t<td class=\"span2\">%s</td>
	\t<td class=\"span1\">%s</td>
	\t<td class=\"span1\">%s</td>
	\t<td class=\"span1\">%s</td>
	\t</tr>\n" => (
		$class, 
		sprintf( '<i class="%s"></i>' => 'tango-'. $class ),
		sprintf( '<i class="%s"></i>' => 'tangolarge-'. $class ),
		sprintf( '<i class="%s"></i>' => 'tangoxlarge-'. $class )
	);
	
}