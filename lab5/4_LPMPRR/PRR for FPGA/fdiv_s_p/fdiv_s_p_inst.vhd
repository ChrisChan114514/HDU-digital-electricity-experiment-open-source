	component fdiv_s_p is
		port (
			source : out std_logic_vector(31 downto 0);                    -- source
			probe  : in  std_logic_vector(15 downto 0) := (others => 'X')  -- probe
		);
	end component fdiv_s_p;

	u0 : component fdiv_s_p
		port map (
			source => CONNECTED_TO_source, -- sources.source
			probe  => CONNECTED_TO_probe   --  probes.probe
		);

