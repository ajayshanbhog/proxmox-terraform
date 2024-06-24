resource "proxmox_vm_qemu" "demo_vm" {
  name = "demo-vm"
  desc = "Did via Terraform"
  vmid = "600"
  target_node = "navisto1"

  agent = 1  
  scsihw = "virtio-scsi-single"
  cores = 2
  sockets = 1
  cpu = "host"
  memory = "2048"
  machine = "q35"
  vm_state = "running"
  network {
    bridge = "vmbr0"
    model = "virtio"
    firewall = true
  }

  disks {
    ide {
      ide2 {
        cdrom {
          
          iso = "local:iso/ubuntu-22.04.4-live-server-amd64.iso"
        }
      }
    }
    scsi {
      scsi0 {
        disk {
          storage = "local-lvm"
          size = "50G"
        }
      }
    }
  }

    efidisk {
    efitype = "4m"
    storage = "local-lvm"
  }
  bios = "ovmf"

  vga {
    type = "virtio"
    memory = 256
  }
}


