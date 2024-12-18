//
//  Services.swift
//  SwiftSup
//
//  Created by Ainur on 17.12.2024.
//

import Supabase
import SwiftUI

final class SupabaseManager {
    static let shared = SupabaseManager()
    
    private let supabaseURL = URL(string: "https://phdelqmezlrdoabsavlt.supabase.co")!
    private let supabaseKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBoZGVscW1lemxyZG9hYnNhdmx0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQxNzAyODMsImV4cCI6MjA0OTc0NjI4M30.0A4jYJVq-dEfqvvrY-fToRCAbM_trOvUafpJZlqi9fk"
    
    lazy var client: SupabaseClient = {
        SupabaseClient(supabaseURL: supabaseURL, supabaseKey: supabaseKey)
    }()
}
