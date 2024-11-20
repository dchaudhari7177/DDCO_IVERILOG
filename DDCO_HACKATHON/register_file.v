module register_file (
    input clk,
    input [2:0] write_address,
    input [7:0] write_data,
    input write_enable,
    input [2:0] read_address,
    output reg [7:0] read_data
);
    reg [7:0] registers [0:7]; // 8 registers of 8-bit size

    always @(posedge clk) begin
        if (write_enable) begin
            registers[write_address] <= write_data; // Write data to register
        end
    end

    always @(*) begin
        read_data = registers[read_address]; // Read data from register
    end
endmodule
