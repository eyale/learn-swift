
protocol AdvancedLifeSupport {
    func performCPR()
}

extension AdvancedLifeSupport {
    func performCPR()  {
        print("AdvancedLifeSupport extended with new extension")
    }
}

class EmergencyCallHandler {
    var delegate: AdvancedLifeSupport?
    
    func assessSituation() {
        print("Tell me what happend?")
    }
    
    func medicalEmergency() {
        delegate?.performCPR()
    }
}

struct Paramedic: AdvancedLifeSupport {
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
//    func performCPR() {
//        print("The paramedic does chest compressions, 30 per second.")
//    }
}

class Doctor: AdvancedLifeSupport {
    
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
//    func performCPR() {
//        print("The doctor does chest compressions, 30 per second.")
//    }
    
    func useStethescope() {
        print("Listening for heart sounds.")
    }
}

class Surgeon: Doctor {
//    override func performCPR() {
//        super.performCPR()
//        print("Sings staying alive by the BeeGees")
//    }
    
    func useElectrictDrill() {
        print("Wrrrrr...")
    }
}

let emilio = EmergencyCallHandler()
let angela = Surgeon(handler: emilio)

emilio.assessSituation()
emilio.medicalEmergency()
angela.performCPR()

