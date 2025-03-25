# Security Detailing Job Inventory Management for QBCore

This script provides an **inventory management system** for the **Security Detailing Job** in FiveM using the **QBCore framework**. It allows players to be equipped with various security-related items such as flashlights, batons, first aid kits, radios, and more.

## Features

- **Security Job Inventory**: A full inventory of 30 items available to players on the Security Detailing Job.
- **Item Management**: Players can equip, use, or check items in their inventory.
- **Job Integration**: Seamless integration with the QBCore job system for the security detailing role.
- **Customizable Items**: Easily modify the list of items in the script to fit the needs of your server.
- **UI Access**: Players can access the security job inventory through a simple UI.

## Installation

1. **Download the Script**:
   - Download the `qb-security-inventory.lua` script and place it inside the `resources/[your_resource_folder]` directory of your server.

2. **Start the Script**:
   - In your `server.cfg`, add `ensure qb-security-inventory` to ensure the script starts when the server boots.

3. **Add Job to QB-Core**:
   - Open the `qb-core` database and add the Security job (or modify it based on your requirements):
     ```lua
     QBCore.Functions.CreateJob('security', 'Security', 'A civilian security detail job.')
     ```

4. **Assign Inventory Items**:
   - Use the event `qb-security-inventory:assignJobItems` to assign the inventory items to players when they start their security job.

5. **Inventory UI**:
   - Players can access their inventory by triggering the `qb-security-inventory:openInventory` event.

## Usage

1. **Assign Security Job Items**:
   - When a player is assigned the security job, they automatically receive the 30 items in their inventory.

2. **Access the Inventory**:
   - Players can access the inventory using a custom UI to equip and manage items related to their security job.

3. **Check for Items**:
   - Players can check if they have a specific item using the `qb-security-inventory:checkItem` event.

## Customization

- You can easily modify the `Config.SecurityItems` table to add or remove items that fit your server’s roleplay needs.

## License

This script is free to use and modify, but crediting the author is appreciated when distributing or using this script publicly.

## Credits

- **Script Creator**: [CrypticTM]
- **QBCore Framework**: Developed by **QBCore**.
