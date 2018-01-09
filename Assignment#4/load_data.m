function  data = load_data() 
            load fisheriris;
            length(species)
            %replace species names with numerical values
            for i = 1:length(species)
                if strcmp(species(i,1),'setosa')
                    species(i,1) = num2cell(-1);
                elseif strcmp(species(i,1),'versicolor')
                    species(i,1) = num2cell(1);
                elseif strcmp(species(i,1),'virginica')
                    species(i,1) = num2cell(1);
                end
            end
                        
            %convert species values from cells to numerical data
            numerical_species = cell2mat(species);

            %combine into one matrix
            merged_data = horzcat(meas, numerical_species);   
            %clear meas;                 %delete meas
            %clear species;              %delete species
            %clear numerical_species;    %delete numerical_species
            data = merged_data;